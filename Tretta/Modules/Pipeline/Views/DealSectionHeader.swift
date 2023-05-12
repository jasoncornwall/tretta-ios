//
//  DealSectionHeader.swift
//  Tretta
//
//  Created by Jason C on 5/2/23.
//

import SwiftUI

struct DealSectionHeader: View {
    let stages: [Stage]
    @Binding var stageSelection: Int
    
    var body: some View {
        VStack(spacing: 14) {
            HStack(spacing: 28) {
                ForEach(Array(stages.enumerated()), id: \.element) { index, stage in
                    VStack {
                        Text(stage.name)
                            .font(.system(size: 12))
                            .foregroundColor(
                                stageSelection == index ? (
                                    Color.trettaGold
                                ) : (
                                    Color.white
                                )
                            )
                            .background(
                                stageSelection == index ? (
                                    Color.trettaGold
                                        .frame(height: 3)
                                        .offset(y: 20)
                                ) : (
                                    Color.clear
                                        .frame(height: 3)
                                        .offset(y: 20)
                                )
                            )
                    }
                }
            }
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.gray)
        }
        .padding(.top, 8)
        .background(Color.backgroundBlue)
    }
}
