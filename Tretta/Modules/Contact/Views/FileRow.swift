//
//  FileRow.swift
//  Tretta
//
//  Created by Jason C on 10/2/23.
//

import SwiftUI

struct FileRow: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Test Sample File")
                .font(.system(size: 14, weight: .semibold))
                .padding(.top, 12)
                .padding(.horizontal, 12)
            HStack {
                Text("5843 KB")
                    .font(.system(size: 11, weight: .semibold))
                Spacer()
                Text("\(Date.now)")
                    .font(.system(size: 11))
            }
            .padding(.bottom, 12)
            .padding(.horizontal, 12)
        }
        .background(Color.homeBodySectionBlue)
        .cornerRadius(12)
        .frame(height: 72)
        .padding(.horizontal, 16)
    }
}
