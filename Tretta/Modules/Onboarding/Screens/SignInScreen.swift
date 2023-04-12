//
//  SignInScreen.swift
//  Tretta
//
//  Created by Jason C on 4/9/23.
//

import SwiftUI

struct SignInScreen: View {
    @State private var text = ""
    var body: some View {
        FloatingTextField(title: "EMAIL", text: $text)
            .onChange(of: text) { newValue in
                print("New Value: \(newValue)")
            }
    }
}

struct SignInScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignInScreen()
    }
}
