//
//  FileList.swift
//  Tretta
//
//  Created by Jason C on 10/2/23.
//

import Files
import SwiftUI

struct FileList: View {
    @Environment(\.openURL) var openURL
    
    @Binding var files: [File]
    @State private var showFile = false
    @State private var selectedImage: UIImage?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Files")
                .font(.system(size: 16, weight: .semibold))
                .padding(.top, 8)
                .padding(.leading, 18)
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.white.opacity(0.3))
                .padding(.bottom, 4)
            ForEach(files) { file in
                FileRow(file: file)
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets())
                    .onTapGesture {
                        do {
                            let fileData = try file.read()
                            let image = UIImage(data: fileData)
                            selectedImage = image
                            showFile.toggle()
                        } catch {
                            print("Error opening file: \(error)")
                        }
                    }
            }
        }
        .sheet(isPresented: $showFile) {
            if let image = selectedImage {
                PhotoDetailView(image: image)
            }
        }
    }
}

extension File: Identifiable {
    public var id: String {
        self.path
    }
}
