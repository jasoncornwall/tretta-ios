//
//  ContactRow.swift
//  Tretta
//
//  Created by Jason C on 4/19/23.
//

import SwiftUI

struct ContactRow: View {
    let contactName: String
    let index: Int
    
    var body: some View {
        HStack {
            Text(contactName)
                .padding(.leading, 24)
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(.white)
            Spacer()
        }
        .frame(height: 56)
        .background(index % 2 == 0 ? Color.homeBodySectionBlue : Color.backgroundBlue)
    }
}

//struct ContactRow_Previews: PreviewProvider {
//    static var previews: some View {
//        ContactRow(contactName: "John Doe", index: 0)
//    }
//}
