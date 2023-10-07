//
//  ContactDetailScreenModel.swift
//  Tretta
//
//  Created by Jason C on 10/3/23.
//

import Files
import MessageUI
import SwiftUI

class ContactDetailScreenModel: ObservableObject {
    
    @Published var contact: Contact
    @Published var showDocumentScanner: Bool
    @Published var files: [File] = []
    
    var canSendMail: Bool {
        MFMailComposeViewController.canSendMail()
    }
    
    init(contact: Contact) {
        self.contact = contact
        self.showDocumentScanner = false
    }
    
    func fetchLocalFiles() {
        // Read all files under current documents directory for this particular contact
        // Only create the directory if it doesn't currently exist
        do {
            guard let contactFiles = try Folder.documents?.createSubfolderIfNeeded(at: contact._id).files else { return }
            
            var parsedFiles: [File] = []
            
            contactFiles.forEach { file in
                parsedFiles.append(file)
            }
            
            self.files = parsedFiles
        } catch {
            print("Error fetching local files: \(error)")
        }
    }
    
    func saveScannedPages(_ scannedPages: [ScannedPage]) {
        do {
            guard let folder = try Folder.documents?.createSubfolderIfNeeded(at: contact._id) else { return }
           
            for scannedPage in scannedPages {
                try folder.createFile(named: scannedPage.title, contents: scannedPage.image.pngData())
            }
        } catch {
            print("Error saving scanned page: \(error)")
        }
    }
    
}

