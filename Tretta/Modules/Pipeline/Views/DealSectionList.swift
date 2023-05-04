//
//  DealSectionList.swift
//  Tretta
//
//  Created by Jason C on 5/3/23.
//

import SwiftUI

struct DealSectionList: View {
    @State var deals: [Deal]
    
    var body: some View {
        List {
            ForEach(Array(deals.enumerated()), id: \.element) { index, deal in
                DealRow(deal: deal)
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets())
                    .onTapGesture {
                        withAnimation {
                            print("Deal tapped: \(deal)")
                        }
                    }
            }
        }.listStyle(.plain)
    }
}
