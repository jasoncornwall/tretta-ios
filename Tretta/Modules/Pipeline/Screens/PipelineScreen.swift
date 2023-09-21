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
    
    var body: some View {
        NavigationStack {
            VStack {
                if !model.pipelines.isEmpty, !model.stages.isEmpty, !model.deals.isEmpty {
                    DealSectionHeader(stages: model.stages.map{$0.name}, stageSelection: $model.stageSelection)
                    TabView(selection: $model.stageSelection) {
                        ForEach(Array(model.stages.enumerated()), id: \.element) { index, stage in
                            DealSectionList(route: $route, deals: model.getDealsByStage(stage._id ?? ""), stageName: stage.name)
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
                        DropdownMenu(selection: $model.currentPipelineSelection.onChange(pipelineSelectionChange(to:)), pipelines: model.pipelines)
                             .padding(.trailing, 16)
                             .padding(.bottom, 8)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        presentedSheet = .createPipeline
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
            model.loadPipelines {
                model.loadStages(pipelineId: model.currentPipelineSelection._id) {
                    model.loadDeals(pipelineId: model.currentPipelineSelection._id)
                }
            }
        }
        .sheet(item: $presentedSheet) { sheet in
            switch sheet {
            case .createPipeline:
                CreatePipelineScreen(pipelineId: model.currentPipelineSelection._id)
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
