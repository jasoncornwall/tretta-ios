//
//  SettingRow.swift
//  Tretta
//
//  Created by Jason C on 6/9/23.
//

import SwiftUI

struct SettingRow: View {
    let settingTitle: String
    
    var body: some View {
        VStack {
            Rectangle()
                .frame(height: 0.5)
                .foregroundColor(.white.opacity(0.2))
            HStack(spacing: 8) {
                Image(systemName: "message.badge.circle")
                    .resizable()
                    .frame(width: 28, height: 28)
//                    .foregroundColor(.trettaGold)
                Text(settingTitle)
                    .font(.system(size: 19, weight: .semibold))
                Spacer()
//                Image("right carat")
            }
            .background(Color.homeBodySectionBlue)
            .frame(height: 40)
            .padding(.horizontal, 16)
            Rectangle()
                .frame(height: 0.5)
                .foregroundColor(.white.opacity(0.2))
        }
        .listRowSeparator(.hidden)
        .listRowInsets(EdgeInsets())
        .background(Color.homeBodySectionBlue)
    }
}
