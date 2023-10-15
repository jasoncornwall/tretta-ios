//
//  DealScreen.swift
//  Tretta
//
//  Created by Jason C on 5/20/23.
//

import SwiftUI

struct DealScreen: View {
    @Environment(\.dismiss) private var dismiss
    
    @StateObject var model: DealScreenModel
        
    var body: some View {
        NavigationStack {
            VStack(alignment: .center, spacing: 24) {
                Text("\(model.deal.name)")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.trettaGold)
                HStack(alignment: .center) {
                    Text("\(model.stageName)")
                        .font(.system(size: 16, weight: .semibold))
                    Circle()
                        .frame(width: 4, height: 4)
                        .foregroundColor(.white)
                        .padding(.horizontal, 2)
                    Text("$\(model.deal.value)")
                        .font(.system(size: 16, weight: .semibold))
                }
                .padding(.top, 8)
                RoomScanList(files: $model.files)
                Spacer()
//                VStack {
//                    DealSectionHeader(stages: sections, stageSelection: $sectionSelection)
//                    TabView(selection: $sectionSelection) {
//                        ForEach(Array(sections.enumerated()), id: \.element) { index, _ in
//                            if index == 0 {
//
//                            } else {
//                                DealNoteList(notes: notes)
//                                    .padding(.top, 6)
//                                    .tag(index)
//                            }
//
//                            // TODO: Replace this with a DealDetailList view for the deal metadata
////                            DealNoteList(notes: notes)
////                                .padding(.top, 4)
////                                .tag(1)
//                        }
//                    }.tabViewStyle(.page(indexDisplayMode: .never))
//                }
//                .background(Color.backgroundBlue)
            }
            .frame(maxWidth: .infinity)
            .background(Color.backgroundBlue)
            .padding(.top, 24)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.trettaGold)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        model.showRoomScanner.toggle()
                    } label: {
                        Image(systemName: "viewfinder")
                            .foregroundColor(.trettaGold)
                    }
                }
            }
            .background(Color.backgroundBlue)
            .toolbarBackground(.hidden, for: .navigationBar)
            .fullScreenCover(isPresented: $model.showRoomScanner) {
                VStack(alignment: .trailing) {
                    if model.scanningState == .finishedScanning {
                        Button {
                            model.showRoomScanner.toggle()
                        } label: {
                            Text("Finish")
                                .foregroundColor(.trettaGold)
                        }
                        .padding(.trailing, 8)
                    } else {
                        Button {
                            model.scanningState = .finishedScanning
                        } label: {
                            Text("Save Room Scan")
                                .foregroundColor(.trettaGold)
                        }
                        .padding(.trailing, 8)
                    }
                    
                    RoomScanner(scanningState: model.scanningState) { result in
                        switch result {
                        case let .success(roomScan):
                            model.saveScannedRoom(roomScan)
                        case let .failure(error):
                            print("Error scanning room: \(error)")
                        }
                    }
                }
            }
        }
        .onAppear {
            model.fetchLocalFiles()
        }
    }
}
