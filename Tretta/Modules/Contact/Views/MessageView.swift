//
//  MessageView.swift
//  Tretta
//
//  Created by Jason C on 10/7/23.
//

import MessageUI
import SwiftUI

struct MessageView: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = MFMessageComposeViewController
    
    let contactNumber: String
    
    class Coordinator: NSObject, MFMessageComposeViewControllerDelegate {
        let parent: MessageView
        
        init(_ parent: MessageView) {
            self.parent = parent
        }
        
        func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
            controller.dismiss(animated: true)
        }
    }
    
    func makeUIViewController(context: Context) -> MFMessageComposeViewController {
        let messageView = MFMessageComposeViewController()
        messageView.recipients = [contactNumber]
        messageView.messageComposeDelegate = context.coordinator
        return messageView
    }
    
    func updateUIViewController(_ uiViewController: MFMessageComposeViewController, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
}
