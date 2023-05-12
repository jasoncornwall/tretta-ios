//
//  DealSectionList.swift
//  Tretta
//
//  Created by Jason C on 5/3/23.
//

import SwiftUI

struct DealSectionList: View {
    let deals: [Deal]
    
    var body: some View {
        List {
            ForEach(Array(deals.enumerated()), id: \.element) { index, deal in
                DealRow(deal: deal)
                    .padding(.bottom, 8)
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets())
                    .onTapGesture {
                        withAnimation {
                            print("Deal tapped: \(deal)")
                        }
                    }
            }
            .background(Color.backgroundBlue)
        }.listStyle(.plain)
    }
}
