//
//  RoomScanList.swift
//  Tretta
//
//  Created by Jason C on 10/11/23.
//

import Files
import SceneKit
import SceneKit.ModelIO
import SwiftUI

struct RoomScanList: View {
    @Environment(\.openURL) var openURL
    
    @Binding var files: [File]
    @State private var showFile = false
    @State private var selectedFile: File?
    
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
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(files) { file in
                    FileRow(file: file)
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets())
                        .onTapGesture {
                            selectedFile = file
                        }
                }
            }
        }
        .sheet(item: $selectedFile, content: { file in
            VStack(alignment: .leading) {
                HStack {
                    Button {
                        selectedFile = nil
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.trettaGold)
                    }
                    .frame(width: 44, height: 44)
                    .padding(.leading, 8)
                    .padding(.top, 8)
                    
                    Spacer()
                    
                    ShareLink(item: file.url) {
                        Image(systemName: "square.and.arrow.up")
                            .foregroundColor(.trettaGold)
                    }
                    .padding(.trailing, 16)
                }
                
                ARQuickLookView(url: file.url)
            }
        })
    }
}

extension RoomScanList {
    
    struct RoomScan: Identifiable {
        var id = UUID().uuidString
        let title: String
    }
    
}
