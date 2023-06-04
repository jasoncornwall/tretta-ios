//
//  NoteRow.swift
//  Tretta
//
//  Created by Jason C on 6/4/23.
//

import SwiftUI

struct NoteRow: View {
    let note: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(note)
                .font(.system(size: 12, weight: .regular))
                .padding(.top, 12)
                .padding(.horizontal, 12)
            HStack {
                Spacer()
                Text("\(Date().description)")
                    .font(.system(size: 10))
                    .foregroundColor(.white.opacity(0.75))
            }
            .padding(.bottom, 12)
            .padding(.horizontal, 12)
        }
        .background(Color.homeBodySectionBlue)
        .cornerRadius(12)
        .padding(.horizontal, 16)
    }
}
