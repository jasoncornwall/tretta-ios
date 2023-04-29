//
//  RecentContactsSection.swift
//  Tretta
//
//  Created by Jason C on 4/18/23.
//

import SwiftUI

struct RecentContactsSection: View {
    var recentContacts = ["Contact Object 1", "Contact Object 2", "Contact Object 3", "Contact Object 4"]
    
    var body: some View {
        VStack {
            HStack {
                Text("Recent Contacts")
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
                    ForEach(recentContacts, id: \.self) { _ in
                        RecentContactCard()
                    }
                }
                .padding(.top, 8)
                .padding(.bottom, 16)
                .padding(.horizontal, 16)
            }
        }
    }
}

//struct RecentContactsSection_Previews: PreviewProvider {
//    static var previews: some View {
//        RecentContactsSection()
//    }
//}
