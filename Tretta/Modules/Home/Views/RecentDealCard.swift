//
//  RecentDealCard.swift
//  Tretta
//
//  Created by Jason C on 4/16/23.
//

import SwiftUI

struct RecentDealCard: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Villa Coworking Space")
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.white)
            HStack(alignment: .bottom) {
                ContactCircle(contactInitials: "T")
                    .foregroundColor(.white)
                Spacer()
                Text("$1000")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.white)
            }
        }
        .frame(width: 144, height: 124)
        .padding(.horizontal, 16)
        .background(Color.cardGray)
        .cornerRadius(12)
        .shadow(color: .gray, radius: 5, x: 4, y: 4)
    }
}

struct RecentDealCard_Previews: PreviewProvider {
    static var previews: some View {
        RecentDealCard()
    }
}
