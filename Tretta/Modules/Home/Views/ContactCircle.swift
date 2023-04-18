//
//  ContactCircle.swift
//  Tretta
//
//  Created by Jason C on 4/17/23.
//

import SwiftUI

struct ContactCircle: View {
    let contactInitials: String
    
    var body: some View {
        ZStack(alignment: .center) {
            Circle()
                .frame(width: 44, height: 44)
                .foregroundColor(.green)
            Text("\(contactInitials)")
                .font(.system(size: 22, weight: .semibold))
        }
    }
}
