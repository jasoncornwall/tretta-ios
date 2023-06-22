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
            LottieView(name: type.image)
                .scaledToFill()
                .frame(width: 250, height: 250)
            Text(type.title)
                .font(.system(size: 20, weight: .bold))
                .padding(.bottom, 2)
            Text(type.description)
                .font(.system(size: 14))
                .foregroundColor(.white.opacity(0.8))
        }
    }
}
