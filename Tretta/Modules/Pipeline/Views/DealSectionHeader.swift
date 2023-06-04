//
//  DealSectionHeader.swift
//  Tretta
//
//  Created by Jason C on 5/2/23.
//

import SwiftUI

struct DealSectionHeader: View {
    let stages: [String]
    @Binding var stageSelection: Int
    
    var body: some View {
        VStack(alignment: .center, spacing: 14) {
            GeometryReader { geometry in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .center ,spacing: 28) {
                        Spacer()
                            .frame(width: 4)
                        ForEach(Array(stages.enumerated()), id: \.element) { index, stage in
                            VStack {
                                Text(stage)
                                    .font(.system(size: 12, weight: .semibold))
                                    .foregroundColor(
                                        stageSelection == index ? (
                                            Color.trettaGold
                                        ) : (
                                            Color.white
                                        )
                                    )
                                // TODO: Figure out a way to make this gold underline animation work
//                                    .background(
//                                        stageSelection == index ? (
//                                            Color.trettaGold
//                                                .frame(height: 3)
//                                                .offset(y: 20)
//                                        ) : (
//                                            Color.clear
//                                                .frame(height: 3)
//                                                .offset(y: 20)
//                                        )
//                                    )
                            }
                        }
                        Spacer()
                            .frame(width: 4)
                    }
                    .frame(minWidth: geometry.size.width)
                }
            }.frame(height: 16)
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.white.opacity(0.3))
        }
        .padding(.top, 8)
        .background(Color.backgroundBlue)
    }
}
