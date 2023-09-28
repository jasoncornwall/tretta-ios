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
                                DealSectionList(route: $route, deals: model.getDealsByStage(stage._id ?? ""), stageName: stage.name)
                                    .padding(.top, 4)
                                    .tag(index)
                            }
                        }
                    }.tabViewStyle(.page(indexDisplayMode: .never))
                } else {
                    Spacer()
                    EmptyStateView(type: .deal)
                        .padding(.bottom, 24)
                    Spacer()
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
        .searchable(text: $model.searchText)
        .tint(.trettaGold)
        .foregroundColor(.white)
        .task {
            model.loadPipelines { error in
                if let error, let statusCode = error.responseCode, statusCode == 500 || statusCode == 401 {
                    // Logout and clear access token for 401/500 response codes
                    KeyStorage.shared.set("", forKey: Constants.accessToken)
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
