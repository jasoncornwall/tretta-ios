//
//  ContactHeader.swift
//  Tretta
//
//  Created by Jason C on 4/19/23.
//

import SwiftUI

struct ContactHeader: View {
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: "circle")
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .frame(width: 56, height: 56)
                .padding(.leading, 24)
            VStack(alignment: .leading, spacing: 2) {
                Text("Jason Cornwall")
                    .font(.system(size: 18, weight: .semibold))
                Text("+1 727-276-9118")
                    .font(.system(size: 14))
            }
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 108)
        .background(Color.homeBodySectionBlue)
    }
}
