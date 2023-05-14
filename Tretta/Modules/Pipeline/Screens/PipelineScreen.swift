//
//  PipelineScreen.swift
//  Tretta
//
//  Created by Jason C on 5/2/23.
//

import SwiftUI

struct PipelineScreen: View {
    @StateObject var model: PipelineScreenModel
    @State private var searchText = ""
    @State private var stageSelection: Int = 0
    @State private var currentPipelineSelection = PipelineMockData.pipelines[0]
    
    var body: some View {
        NavigationStack {
            VStack {
                DealSectionHeader(stages: model.stages, stageSelection: $stageSelection)
                TabView(selection: $stageSelection) {
                    ForEach(Array(model.stages.enumerated()), id: \.element) { index, stage in
                        DealSectionList(deals: model.getDealsByStage(stage._id))
                            .padding(.top, 4)
                            .tag(index)
                    }
                }.tabViewStyle(.page(indexDisplayMode: .never))
            }
            .background(Color.backgroundBlue)
            .navigationTitle("Sales Pipeline")
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    DropdownMenu(selection: $currentPipelineSelection.onChange(pipelineSelectionChange(to:)), pipelines: PipelineMockData.pipelines)
                         .padding(.trailing, 16)
                         .padding(.bottom, 8)
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
        .searchable(text: $searchText)
        .tint(.trettaGold)
        .foregroundColor(.white)
        .task {
            model.loadPipelines()
            model.loadStages(pipelineId: currentPipelineSelection._id)
            model.loadDeals(pipelineId: currentPipelineSelection._id)
        }
    }
    
    func pipelineSelectionChange(to value: Pipeline) {
        print("Current pipeline: \(currentPipelineSelection)")
        // Reload local pipeline data
        model.loadStages(pipelineId: currentPipelineSelection._id)
        model.loadDeals(pipelineId: currentPipelineSelection._id)
    }
}
