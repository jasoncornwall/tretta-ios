//
//  DropdownMenu.swift
//  Tretta
//
//  Created by Jason C on 4/17/23.
//

import SwiftUI

struct DropdownMenu: View {
    @State var selection: String
    let pipelines = ["Current Sales", "Coffee Shops", "Enterprise"]
    
    var body: some View {
        Picker("Select pipeline", selection: $selection) {
            ForEach(pipelines, id: \.self) {
                Text($0)
            }
        }
        .pickerStyle(.menu)
        .frame(height: 40)
        .background(Color.cardGray)
        .cornerRadius(12)
        .tint(.white)
        .shadow(color: .gray, radius: 5, x: 2, y: 2)
    }
}

struct DropdownMenu_Previews: PreviewProvider {
    @State static private var pipeline = "Current Sales"
    static var previews: some View {
        DropdownMenu(selection: pipeline)
    }
}
