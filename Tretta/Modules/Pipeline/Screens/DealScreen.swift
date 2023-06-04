//
//  DealScreen.swift
//  Tretta
//
//  Created by Jason C on 5/20/23.
//

import SwiftUI

struct DealScreen: View {
    @State private var sectionSelection: Int = 0
    private let sections = ["Notes", "Details"]
    private let notes = [
        "Meeting established to discuss potential product integrations. Relevant stakeholders looped in.",
        "15 sales reps will be added to the roster next month and 5 engineers will be added next quarter."
    ]
    
    @Binding var route: Route
    let deal: Deal
    let stageName: String
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center, spacing: 24) {
                Text("\(deal.name)")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.trettaGold)
                HStack(alignment: .center) {
                    Text("\(stageName)")
                        .font(.system(size: 16, weight: .semibold))
                    Circle()
                        .frame(width: 4, height: 4)
                        .foregroundColor(.white)
                        .padding(.horizontal, 2)
                    Text("$\(deal.value)")
                        .font(.system(size: 16, weight: .semibold))
                }
                .padding(.top, 8)
                VStack {
                    DealSectionHeader(stages: sections, stageSelection: $sectionSelection)
                    TabView(selection: $sectionSelection) {
                        ForEach(Array(sections.enumerated()), id: \.element) { index, _ in
                            DealNoteList(notes: notes)
                                .padding(.top, 6)
                                .tag(index)
                            
                            // TODO: Replace this with a DealDetailList view for the deal metadata
//                            DealNoteList(notes: notes)
//                                .padding(.top, 4)
//                                .tag(1)
                        }
                    }.tabViewStyle(.page(indexDisplayMode: .never))
                }
                .background(Color.backgroundBlue)
            }
            .frame(maxWidth: .infinity)
            .background(Color.backgroundBlue)
            .padding(.top, 24)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        route = .rootMain(2)
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.trettaGold)
                    }
                }
                if sectionSelection == 0 {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            withAnimation {
                                print("Add note tapped")
                            }
                        } label: {
                            Text("Add")
                                .foregroundColor(.trettaGold)
                        }
                    }
                }
            }
            .background(Color.backgroundBlue)
            .toolbarBackground(.hidden, for: .navigationBar)
        }
    }
}
