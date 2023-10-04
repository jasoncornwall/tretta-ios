//
//  FileList.swift
//  Tretta
//
//  Created by Jason C on 10/2/23.
//

import SwiftUI

struct FileList: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Files")
                .font(.system(size: 16, weight: .semibold))
                .padding(.top, 8)
                .padding(.leading, 16)
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.white.opacity(0.3))
                .padding(.bottom, 4)
            ForEach(0..<3) { _ in
                FileRow()
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets())
                    .onTapGesture {
                        print("File tapped")
                    }
            }
        }
    }
}
