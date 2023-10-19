//
//  DealRow.swift
//  Tretta
//
//  Created by Jason C on 5/4/23.
//

import SwiftUI

struct DealRow: View {
    let deal: Deal
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(deal.name)
                .font(.system(size: 16, weight: .semibold))
                .padding(.top, 12)
                .padding(.horizontal, 12)
            HStack {
                Text("Created: \(deal.creationDate.formatted(date: .complete, time: .omitted))")
                    .font(.system(size: 11))
                Spacer()
                Text("$\(deal.value)")
                    .font(.system(size: 12, weight: .semibold))
            }
            .padding(.bottom, 12)
            .padding(.horizontal, 12)
        }
        .background(Color.homeBodySectionBlue)
        .cornerRadius(12)
        .frame(height: 72)
        .padding(.horizontal, 16)
    }
}
