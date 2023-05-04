//
//  PipelineScreen.swift
//  Tretta
//
//  Created by Jason C on 5/2/23.
//

import SwiftUI

struct PipelineScreen: View {
    let deals: [String] = ["Qualified", "Follow Up", "In Progress", "Closed"]
    
    @State private var searchText = ""
    @State private var stageSelection: Int = 0
    
    var body: some View {
        NavigationStack {
            VStack {
                DealSectionHeader(deals: deals, stageSelection: $stageSelection)
                TabView(selection: $stageSelection) {
                    Text("Qualified")
                        .tag(0)
                    Text("Follow Up")
                        .tag(1)
                    Text("In Progress")
                        .tag(2)
                    Text("Closed")
                        .tag(3)
                }.tabViewStyle(.page(indexDisplayMode: .never))
            }
            .background(Color.backgroundBlue)
            .navigationTitle("Sales Pipeline")
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    DropdownMenu(selection: "Current Sales")
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
    }
}
