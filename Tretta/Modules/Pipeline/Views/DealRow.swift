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
        VStack(spacing: 8) {
            Text(deal.name)
                .font(.system(size: 16, weight: .semibold))
            HStack {
                Text("Created: \(deal.creationDate)")
                    .font(.system(size: 11))
                Spacer()
                Text("$\(deal.value)")
                    .font(.system(size: 11, weight: .semibold))
            }
        }
        .background(Color.homeBodySectionBlue)
        .frame(height: 72)
        .padding(.horizontal, 16)
        .cornerRadius(12)
    }
}
