//
//  MailView.swift
//  Tretta
//
//  Created by Jason C on 10/7/23.
//

import MessageUI
import SwiftUI

struct MailView: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = MFMailComposeViewController
    
    let contactEmail: String
    
    class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
        let parent: MailView
        
        init(_ parent: MailView) {
            self.parent = parent
        }
        
        func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
            controller.dismiss(animated: true)
        }
    }
    
    func makeUIViewController(context: Context) -> MFMailComposeViewController {
        let mailView = MFMailComposeViewController()
        mailView.setToRecipients([contactEmail])
        mailView.mailComposeDelegate = context.coordinator
        return mailView
    }
    
    func updateUIViewController(_ uiViewController: MFMailComposeViewController, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
}
