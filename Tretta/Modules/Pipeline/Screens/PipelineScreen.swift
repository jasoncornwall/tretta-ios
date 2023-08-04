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
    
    var body: some View {
        NavigationStack {
            VStack {
                if !model.pipelines.isEmpty {
                    DealSectionHeader(stages: model.stages.map{$0.name}, stageSelection: $model.stageSelection)
                    TabView(selection: $model.stageSelection) {
                        ForEach(Array(model.stages.enumerated()), id: \.element) { index, stage in
                            DealSectionList(route: $route, deals: model.getDealsByStage(stage._id), stageName: stage.name)
                                .padding(.top, 4)
                                .tag(index)
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
                        DropdownMenu(selection: $model.currentPipelineSelection.onChange(pipelineSelectionChange(to:)), pipelines: PipelineMockData.pipelines)
                             .padding(.trailing, 16)
                             .padding(.bottom, 8)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        print("Plus button tapped.")
                    } label: {
                        Image(systemName: "plus")
                            .foregroundColor(.trettaGold)
                    }
                }
            }
        }
        .searchable(text: $model.searchText)
        .tint(.trettaGold)
        .foregroundColor(.white)
        .task {
            model.loadPipelines()
            model.loadStages(pipelineId: model.currentPipelineSelection._id)
            model.loadDeals(pipelineId: model.currentPipelineSelection._id)
        }
    }
    
    func pipelineSelectionChange(to value: Pipeline) {
        // Reload local pipeline data
        model.loadStages(pipelineId: value._id)
        model.loadDeals(pipelineId: value._id)
    }
}
