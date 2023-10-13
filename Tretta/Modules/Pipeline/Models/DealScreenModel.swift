//
//  DealScreenModel.swift
//  Tretta
//
//  Created by Jason C on 10/12/23.
//

import Files
import RoomPlan
import SwiftUI

class DealScreenModel: ObservableObject {
    @Published var sectionSelection: Int = 0
    private let sections = ["Room Scans", "Details"]
    private let notes = [
        "Meeting established to discuss potential product integrations. Relevant stakeholders looped in.",
        "15 sales reps will be added to the roster next month and 5 engineers will be added next quarter."
    ]
    
    @Published var deal: Deal
    @Published var stageName: String
    @Published var showRoomScanner: Bool
    @Published var scanningState: RoomScannerState = .scanning
    @Published var files: [File] = []
    
    init(deal: Deal, stageName: String) {
        self.deal = deal
        self.stageName = stageName
        self.showRoomScanner = false
    }
    
    func fetchLocalFiles() {
        // Read all files under current documents directory for this particular property
        // Only create the directory if it doesn't currently exist
        do {
            guard let propertyFiles = try Folder.documents?.createSubfolderIfNeeded(at: deal._id).files else { return }
            
            var parsedFiles: [File] = []
            
            propertyFiles.forEach { file in
                parsedFiles.append(file)
            }
            
            self.files = parsedFiles
        } catch {
            print("Error fetching local files: \(error)")
        }
    }
    
    func saveScannedRoom(_ scannedRoom: CapturedRoom) {
        do {
            guard let folder = try Folder.documents?.createSubfolderIfNeeded(at: deal._id) else { return }
                        
            let fileName = "\(UUID().uuidString).usd"
            let folderURL = folder.url.appendingPathComponent(fileName)
            
            try scannedRoom.export(to: folderURL)
        } catch {
            print("Error saving scanned room: \(error)")
        }
    }
}

enum RoomScannerState {
    case scanning
    case finishedScanning
}
