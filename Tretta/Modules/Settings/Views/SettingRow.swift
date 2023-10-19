//
//  SettingRow.swift
//  Tretta
//
//  Created by Jason C on 6/9/23.
//

import SwiftUI

struct SettingRow: View {
    let type: RowType
    
    var body: some View {
        VStack {
            Rectangle()
                .frame(height: 0.5)
                .foregroundColor(.white.opacity(0.2))
            HStack(spacing: 8) {
                Image(systemName: type.imageName)
                    .resizable()
                    .frame(width: 28, height: 28)
                Text(type.title)
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

extension SettingRow {
    
    enum RowType {
        case contactUs
        case assistant
        
        var imageName: String {
            switch self {
            case .contactUs:
                return "envelope.circle"
            case .assistant:
                return "message.badge.circle"
            }
        }
        
        var title: String {
            switch self {
            case .contactUs:
                return "Contact Us"
            case .assistant:
                return "Smart Assistant"
            }
        }
    }
    
}
