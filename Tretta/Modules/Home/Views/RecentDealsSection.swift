//
//  RecentDealsSection.swift
//  Tretta
//
//  Created by Jason C on 4/18/23.
//

import SwiftUI

struct RecentDealsSection: View {
    var recentDeals = ["Deal Object 1", "Deal Object 2", "Deal Object 3", "Deal Object 4"]
    
    var body: some View {
        VStack {
            HStack {
                Text("Recent Deals")
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(.trettaGold)
                Spacer()
                Button("View All") {
                    print("View All Tapped")
                }
                .foregroundColor(.white)
            }
            .padding(.horizontal, 16)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(recentDeals, id: \.self) { _ in
                        RecentDealCard()
                    }
                }
                .padding(.top, 8)
                .padding(.bottom, 16)
                .padding(.horizontal, 16)
            }
        }
    }
}

//struct RecentDealsSection_Previews: PreviewProvider {
//    static var previews: some View {
//        RecentDealsSection()
//    }
//}
