//
//  PipelineScreen.swift
//  Tretta
//
//  Created by Jason C on 5/2/23.
//

import SwiftUI

struct PipelineScreen: View {
    @Binding var route: Route
    @StateObject var model: PipelineScreenModel
    
    @State private var presentedSheet: PipelineSheet?
    @State private var showingOptions = false
    @State private var loadingState: LoadingState = .loading
    
    var body: some View {
        NavigationStack {
            VStack {
                switch loadingState {
                case .loading:
                    ProgressView()
                        .controlSize(.large)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                case .empty:
                    EmptyStateView(type: .deal)
                        .frame(maxHeight: .infinity)
                        .padding(.bottom, 200)
                case .complete:
                    DealSectionHeader(stages: model.stages.map{$0.name}, stageSelection: $model.stageSelection)
                    TabView(selection: $model.stageSelection) {
                        if !model.deals.isEmpty {
                            ForEach(Array(model.stages.enumerated()), id: \.element) { index, stage in
                                DealSectionList(
                                    pipelineId: model.currentPipelineSelection._id,
                                    deals: model.getDealsByStage(stage._id ?? ""),
                                    stageName: stage.name,
                                    selectedDeal: $presentedSheet)
                                    .padding(.top, 4)
                                    .tag(index)
                            }
                        }
                    }.tabViewStyle(.page(indexDisplayMode: .never))
                }
            }
            .frame(maxWidth: .infinity)
            .background(Color.backgroundBlue)
            .navigationTitle("Property Pipeline")
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    if !model.pipelines.isEmpty {
                        DropdownMenu(selection: $model.currentPipelineSelection.onChange(pipelineSelectionChange(to:)), pipelines: model.pipelines)
                             .padding(.trailing, 16)
                             .padding(.bottom, 8)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingOptions.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .foregroundColor(.trettaGold)
                    }
                    .confirmationDialog("Select what you'd like to do", isPresented: $showingOptions) {
                        Button("Create a pipeline") {
                            presentedSheet = .createPipeline
                        }
                        
                        if !model.pipelines.isEmpty {
                            Button("Add a property") {
                                presentedSheet = .createDeal
                            }
                        }
                    }
                }
            }
        }
//        .searchable(text: $model.searchText)
        .tint(.trettaGold)
        .foregroundColor(.white)
        .task {
            model.loadPipelines { error in
                if let error, let statusCode = error.responseCode, statusCode == 500 || statusCode == 401 {
                    // Logout and clear access token/accountId for 401/500 response codes
                    KeyStorage.shared.clearValue(forKey: Constants.accessToken)
                    KeyStorage.shared.clearValue(forKey: Constants.accountIdKey)
                    route = .onboarding(.signIn)
                } else {
                    model.loadStages(pipelineId: model.currentPipelineSelection._id) {
                        model.loadDeals(pipelineId: model.currentPipelineSelection._id) {
                            model.loadContacts()
                            loadingState = !model.deals.isEmpty ? .complete : .empty
                        }
                    }
                }
            }
        }
        .fullScreenCover(item: $presentedSheet, content: { sheet in
            switch sheet {
            case .createPipeline:
                CreatePipelineScreen()
            case .createDeal:
                let model = CreateDealScreenModel(
                    pipelineId: model.currentPipelineSelection._id,
                    contacts: model.contacts,
                    stages: model.stages
                )
                CreateDealScreen(model: model)
            case let .viewDeal(deal, stageName):
                let model = DealScreenModel(
                    deal: deal,
                    stageName: stageName,
                    stages: model.stages
                )
                DealScreen(model: model)
            }
        })
    }
    
    func pipelineSelectionChange(to value: Pipeline) {
        // Reload local pipeline data
        model.loadStages(pipelineId: value._id) {
            model.loadDeals(pipelineId: value._id) {
                loadingState = !model.deals.isEmpty ? .complete : .empty
            }
        }
    }
}

// TODO: - Remove deal selection when no pipelines have yet been created.
