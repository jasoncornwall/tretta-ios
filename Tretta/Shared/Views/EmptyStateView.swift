//
//  EmptyStateView.swift
//  Tretta
//
//  Created by Jason C on 6/21/23.
//

import SwiftUI

struct EmptyStateView: View {
    var body: some View {
        VStack {
            Image("contacts_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 92, height: 92)
                .padding(.bottom, 8)
            Text("Your Contact List is Empty")
                .font(.system(size: 20, weight: .bold))
                .padding(.bottom, 2)
            Text("Looks like you haven't added any contacts yet.")
                .font(.system(size: 14))
                .foregroundColor(.white.opacity(0.8))
        }
    }
}
