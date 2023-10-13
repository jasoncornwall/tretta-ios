//
//  DealSectionList.swift
//  Tretta
//
//  Created by Jason C on 5/3/23.
//

import SwiftUI

struct DealSectionList: View {
    let pipelineId: String
    @State var deals: [Deal]
    let stageName: String
    @Binding var selectedDeal: PipelineSheet?
    
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
                            selectedDeal = .viewDeal(deal: deal, stageName: stageName)
                        }
                }
                .background(Color.backgroundBlue)
            }.listStyle(.plain)
//            .refreshable {
//                PipelineApiService.getDeals(pipelineId: pipelineId) { result in
//                    switch result {
//                    case let .success(updatedDeals):
//                        deals = updatedDeals
//                    case let .failure(error):
//                        print("Error fetching deals: \(error)")
//                    }
//                }
//            }
        }
    }
}
