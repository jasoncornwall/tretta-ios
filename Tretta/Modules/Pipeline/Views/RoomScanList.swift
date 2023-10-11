//
//  RoomScanList.swift
//  Tretta
//
//  Created by Jason C on 10/11/23.
//

import SwiftUI

struct RoomScanList: View {
    @Environment(\.openURL) var openURL
    
//    @Binding var files: [RoomScan]
    @State private var showFile = false
    @State private var selectedImage: UIImage?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Room Scans")
                .font(.system(size: 16, weight: .semibold))
                .padding(.top, 8)
                .padding(.leading, 18)
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.white.opacity(0.3))
                .padding(.bottom, 4)
//            ForEach(files) { file in
//                Text(file.title)
////                FileRow(file: file)
////                    .listRowSeparator(.hidden)
////                    .listRowInsets(EdgeInsets())
////                    .onTapGesture {
////                        do {
////                            let fileData = try file.read()
////                            let image = UIImage(data: fileData)
////                            selectedImage = image
////                            showFile.toggle()
////                        } catch {
////                            print("Error opening file: \(error)")
////                        }
////                    }
//            }
        }
        .sheet(isPresented: $showFile) {
            if let image = selectedImage {
                PhotoDetailView(image: image)
            }
        }
    }
}

extension RoomScanList {
    
    struct RoomScan: Identifiable {
        var id = UUID().uuidString
        let title: String
    }
    
}
