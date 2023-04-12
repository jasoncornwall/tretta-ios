//
//  PillButton.swift
//  Tretta
//
//  Created by Jason C on 4/12/23.
//

import SwiftUI

struct PillButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 14, weight: .bold))
            .frame(width: 200, height: 48)
            .background(Color.trettaGold)
            .foregroundColor(.white)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.1 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}
