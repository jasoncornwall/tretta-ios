//
//  CreatePipelineScreen.swift
//  Tretta
//
//  Created by Jason C on 9/21/23.
//

import SwiftUI

struct CreatePipelineScreen: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var pipelineNameText = ""
    @State private var stage1Text = ""
    @State private var stage2Text = ""
    @State private var stage3Text = ""
    @State private var stage4Text = ""
    @State private var visibleStageCounter = 1
        
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                    .frame(height: 24)
                FloatingTextField(title: "Pipeline Name", text: $pipelineNameText)
                    .padding(.horizontal, 40)
                HStack {
                    Text("Select your stage names:")
                        .font(.system(size: 18, weight: .semibold))
                        .padding(.leading, 24)
                    Spacer()
                }
                .padding(.top, 24)
                .padding(.bottom, 16)
                Group {
                    ScrollView(.vertical, showsIndicators: false) {
                        FloatingTextField(title: "Stage 1", text: $stage1Text)
                            .padding(.horizontal, 40)
                            .padding(.top, 12)
                            .onChange(of: stage1Text) { newValue in
//                                print("Stage 1 Value: \(newValue)")
                            }
                        Spacer()
                            .frame(height: 32)
                            FloatingTextField(title: "Stage 2", text: $stage2Text)
                                .padding(.horizontal, 40)
                                .onChange(of: stage2Text) { newValue in
//                                    print("Stage 2 Value: \(newValue)")
                                }
                            Spacer()
                                .frame(height: 32)
                            FloatingTextField(title: "Stage 3", text: $stage3Text)
                                .padding(.horizontal, 40)
                                .onChange(of: stage3Text) { newValue in
//                                    print("Stage 3 Value: \(newValue)")
                                }
                            Spacer()
                                .frame(height: 32)
                            FloatingTextField(title: "Last Stage", text: $stage4Text)
                                .padding(.horizontal, 40)
                                .onChange(of: stage4Text) { newValue in
//                                    print("Stage 4 Value: \(newValue)")
                                }
                            Spacer()
                                .frame(height: 24)
                    }
                    Button("Save New Pipeline") {
                        // Eventually this callback hell will be refactored...eventually.
                        guard let accountId = KeyStorage.shared.getStringValue(forKey: Constants.accountIdKey) else {
                            return
                        }
                        // Create the initial pipeline with the accountId
                        PipelineApiService.createPipeline(pipeline: Pipeline(_id: "", name: pipelineNameText, userId: accountId)) { pipelineResult in
                            switch pipelineResult {
                            case let .success(pipeline):
                                // Create the first stage and add it to the pipeline.
                                PipelineApiService.createStage(stage: Stage(_id: "", name: stage1Text, pipelineOrderIdx: 0, pipelineId: pipeline._id)) { firstStageResult in
                                    switch firstStageResult {
                                    case .success:
                                        PipelineApiService.createStage(stage: Stage(_id: "", name: stage2Text, pipelineOrderIdx: 1, pipelineId: pipeline._id)) { secondStageResult in
                                            switch secondStageResult {
                                            case .success:
                                                PipelineApiService.createStage(stage: Stage(_id: "", name: stage3Text, pipelineOrderIdx: 2, pipelineId: pipeline._id)) { thirdStageResult in
                                                    switch thirdStageResult {
                                                    case .success:
                                                        PipelineApiService.createStage(stage: Stage(_id: "", name: stage4Text, pipelineOrderIdx: 3, pipelineId: pipeline._id)) { lastStageResult in
                                                            switch lastStageResult {
                                                            case .success:
                                                                AnalyticsManager.shared.log(.createPipelineSucceeded)
                                                                dismiss()
                                                            case let .failure(error):
                                                                AnalyticsManager.shared.log(.createPipelineFailed(reason: error.localizedDescription))
                                                                print("Error creating stage 4, the last stage: \(error)")
                                                            }
                                                        }
                                                    case let .failure(error):
                                                        AnalyticsManager.shared.log(.createPipelineFailed(reason: error.localizedDescription))
                                                        print("Error creating stage 3: \(error)")
                                                    }
                                                }
                                            case let .failure(error):
                                                AnalyticsManager.shared.log(.createPipelineFailed(reason: error.localizedDescription))
                                                print("Error creating stage 2: \(error)")
                                            }
                                        }
                                    case let .failure(error):
                                        AnalyticsManager.shared.log(.createPipelineFailed(reason: error.localizedDescription))
                                        print("Error creating stage 1: \(error)")
                                    }
                                }
                            case let .failure(error):
                                AnalyticsManager.shared.log(.createPipelineFailed(reason: error.localizedDescription))
                                print("Error creating pipeline: \(error)")
                            }
                        }
                        print("Create Pipeline tapped.")
                    }
                    .buttonStyle(ClearButton())
                    // See https://developer.apple.com/forums/thread/727272 for an understanding of the issue here.
//                    List($stages) { $stage in
//                        FloatingTextField(title: "Stage \($stage.pipelineOrderIdx.wrappedValue + 1)", text: $stage.name)
//                            .padding(.horizontal, 40)
//                    }.listStyle(.plain)
//                    .scrollContentBackground(.hidden)
//                    .background(Color.backgroundBlue)
                }
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .background(Color.backgroundBlue)
            .navigationTitle("Create Pipeline")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.trettaGold)
                    }
                }
            }
        }
    }
}
