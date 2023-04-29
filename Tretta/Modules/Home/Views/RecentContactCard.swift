//
//  RecentContactCard.swift
//  Tretta
//
//  Created by Jason C on 4/17/23.
//

import SwiftUI

struct RecentContactCard: View {
    var body: some View {
        VStack {
            ContactCircle(contactInitials: "RD")
                .foregroundColor(.white)
                .padding(.bottom, 2)
            Text("Richard Deloite")
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.white)
        }
        .frame(width: 144, height: 108)
        .padding(.horizontal, 16)
        .background(Color.cardGray)
        .cornerRadius(12)
        .shadow(color: .shadowGray, radius: 5, x: 4, y: 4)
    }
}

//struct RecentContactCard_Previews: PreviewProvider {
//    static var previews: some View {
//        RecentContactCard()
//    }
//}
