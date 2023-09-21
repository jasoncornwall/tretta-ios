//
//  CreatePipelineScreen.swift
//  Tretta
//
//  Created by Jason C on 9/21/23.
//

import SwiftUI

struct CreatePipelineScreen: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var pipelineTitleText = ""
    @State private var stage1Text = ""
    @State private var stage2Text = ""
    @State private var stage3Text = ""
    @State private var stage4Text = ""
    @State private var visibleStageCounter = 1
    
    let pipelineId: String
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                    .frame(height: 24)
                FloatingTextField(title: "Pipeline Title", text: $pipelineTitleText)
                    .padding(.horizontal, 40)
                HStack {
                    Text("Select your stage names:")
                        .font(.system(size: 18, weight: .semibold))
                        .padding(.leading, 24)
                    Spacer()
                }
                .padding(.top, 48)
                .padding(.bottom, 16)
                Group {
                    ScrollView(.vertical, showsIndicators: false) {
                        FloatingTextField(title: "Stage 1", text: $stage1Text)
                            .padding(.horizontal, 40)
                            .padding(.top, 12)
                            .onChange(of: stage1Text) { newValue in
                                print("Stage 1 Value: \(newValue)")
                            }
                        Spacer()
                            .frame(height: 32)
                            FloatingTextField(title: "Stage 2", text: $stage2Text)
                                .padding(.horizontal, 40)
                                .onChange(of: stage2Text) { newValue in
                                    print("Stage 2 Value: \(newValue)")
                                }
                            Spacer()
                                .frame(height: 32)
                            FloatingTextField(title: "Stage 3", text: $stage3Text)
                                .padding(.horizontal, 40)
                                .onChange(of: stage3Text) { newValue in
                                    print("Stage 3 Value: \(newValue)")
                                }
                            Spacer()
                                .frame(height: 32)
                            FloatingTextField(title: "Last Stage", text: $stage4Text)
                                .padding(.horizontal, 40)
                                .onChange(of: stage4Text) { newValue in
                                    print("Stage 4 Value: \(newValue)")
                                }
                            Spacer()
                                .frame(height: 24)
                    }
                    Button("Save New Pipeline") {
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
