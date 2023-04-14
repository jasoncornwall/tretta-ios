//
//  CheckboxToggle.swift
//  Tretta
//
//  Created by Jason C on 4/14/23.
//

import SwiftUI

struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            RoundedRectangle(cornerRadius: 5.0)
                .stroke(lineWidth: 4)
                .frame(width: 25, height: 25)
                .cornerRadius(5.0)
                .foregroundColor(.white)
                .overlay {
                    Image(systemName: configuration.isOn ? "checkmark" : "")
                        .foregroundColor(.white)
                }
                .onTapGesture {
                    withAnimation(.spring()) {
                        configuration.isOn.toggle()
                    }
                }
            configuration.label
                .padding(.leading, 4)
                .font(.system(size: 14))
                .foregroundColor(.white)
        }
    }
}
