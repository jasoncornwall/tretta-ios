//
//  EmptyStateView.swift
//  Tretta
//
//  Created by Jason C on 6/21/23.
//

import SwiftUI

struct EmptyStateView: View {
    
    let type: EmptyStateType
    
    var body: some View {
        VStack {
            Image(type.image)
                .resizable()
                .scaledToFit()
                .frame(width: 92, height: 92)
                .padding(.bottom, 8)
            Text(type.title)
                .font(.system(size: 20, weight: .bold))
                .padding(.bottom, 2)
            Text(type.description)
                .font(.system(size: 14))
                .foregroundColor(.white.opacity(0.8))
        }
    }
}
