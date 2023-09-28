//
//  DealSectionList.swift
//  Tretta
//
//  Created by Jason C on 5/3/23.
//

import SwiftUI

struct DealSectionList: View {
    let deals: [Deal]
    let stageName: String
    @State private var selectedDeal: Deal?
    
    var body: some View {
        if deals.isEmpty {
            EmptyStateView(type: .deal)
                .padding(.bottom, 24)
        } else {
            List {
                ForEach(Array(deals.enumerated()), id: \.element) { index, deal in
                    DealRow(deal: deal)
                        .padding(.bottom, 8)
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets())
                        .onTapGesture {
                            selectedDeal = deal
                        }
                }
                .background(Color.backgroundBlue)
            }.listStyle(.plain)
                .sheet(item: $selectedDeal) { deal in
                    DealScreen(deal: deal, stageName: stageName)
                }
        }
    }
}
