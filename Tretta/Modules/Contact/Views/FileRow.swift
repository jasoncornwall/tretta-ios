//
//  FileRow.swift
//  Tretta
//
//  Created by Jason C on 10/2/23.
//

import Files
import SwiftUI

struct FileRow: View {
    let file: File
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(file.name)
                .font(.system(size: 14, weight: .semibold))
                .padding(.top, 12)
                .padding(.horizontal, 12)
            HStack {
                Text("\(file.creationDate?.formatted(date: .complete, time: .omitted) ?? Date().formatted(date: .complete, time: .omitted))")
                    .font(.system(size: 11, weight: .semibold))
                Spacer()
//                Text("\(file.creationDate ?? Date())")
//                    .font(.system(size: 11))
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
