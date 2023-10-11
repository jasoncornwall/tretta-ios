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
    
    var body: some View {
        NavigationStack {
            VStack {
                if !model.pipelines.isEmpty, !model.stages.isEmpty {
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
                } else {
                    EmptyStateView(type: .deal)
                        .frame(maxHeight: .infinity)
                        .padding(.bottom, 200)
                }
            }
            .frame(maxWidth: .infinity)
            .background(Color.backgroundBlue)
            .navigationTitle("Sales Pipeline")
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
                        
                        Button("Create a deal") {
                            presentedSheet = .createDeal
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
                        model.loadContacts()
                        model.loadDeals(pipelineId: model.currentPipelineSelection._id)
                    }
                }
            }
        }
        .sheet(item: $presentedSheet) { sheet in
            switch sheet {
            case .createPipeline:
                CreatePipelineScreen()
            case .createDeal:
                let dealScreenModel = CreateDealScreenModel(
                    pipelineId: model.currentPipelineSelection._id,
                    contacts: model.contacts,
                    stages: model.stages
                )
                CreateDealScreen(model: dealScreenModel)
            case let .viewDeal(deal, stageName):
                DealScreen(deal: deal, stageName: stageName)
            }
        }
    }
    
    func pipelineSelectionChange(to value: Pipeline) {
        // Reload local pipeline data
        model.loadStages(pipelineId: value._id) {
            model.loadDeals(pipelineId: value._id)
        }
    }
}

// TODO: - Remove deal selection when no pipelines have yet been created.
