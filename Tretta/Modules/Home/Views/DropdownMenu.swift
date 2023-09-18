//
//  DropdownMenu.swift
//  Tretta
//
//  Created by Jason C on 4/17/23.
//

import SwiftUI

struct DropdownMenu: View {
    @Binding var selection: Pipeline
    let pipelines: [Pipeline]
    
    var body: some View {
        Picker("Select pipeline", selection: $selection) {
            ForEach(pipelines, id: \.self._id) {
                Text($0.name).tag($0 as Pipeline)
            }
        }
        .scaledToFit()
        .pickerStyle(.automatic)
        .background(Color.cardGray)
        .cornerRadius(12)
        .tint(.white)
        .shadow(color: .shadowGray, radius: 5, x: 2, y: 2)
    }
}

//struct DropdownMenu_Previews: PreviewProvider {
//    @State static private var pipeline = "Current Sales"
//    static var previews: some View {
//        DropdownMenu(selection: pipeline)
//    }
//}
