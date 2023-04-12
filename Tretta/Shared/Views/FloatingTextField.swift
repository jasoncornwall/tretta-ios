//
//  FloatingTextField.swift
//  Tretta
//
//  Created by Jason C on 4/10/23.
//

import SwiftUI


struct FloatingTextField: View {
    let title: String
    let text: Binding<String>

    var body: some View {
        ZStack(alignment: .leading) {
            Text(title)
                .font(.system(size: 15))
                .foregroundColor(text.wrappedValue.isEmpty ? Color(.placeholderText) : .accentColor)
                .offset(y: text.wrappedValue.isEmpty ? 0 : -25)
                .scaleEffect(text.wrappedValue.isEmpty ? 1 : 0.75, anchor: .leading)
                .padding(.bottom, 14)
            VStack {
                TextField("", text: text)
                    .padding(.bottom, 4)
                Rectangle()
                    .frame(height: 2)
                    .foregroundColor(.black)
            }
        }
        .padding(.top, 15)
        .padding(.horizontal, 56)
        .animation(.spring(response: 0.3, dampingFraction: 0.7), value: text.wrappedValue)
    }
}
