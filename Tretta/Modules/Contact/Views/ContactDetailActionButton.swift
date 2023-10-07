//
//  ContactDetailActionButton.swift
//  Tretta
//
//  Created by Jason C on 4/27/23.
//

import SwiftUI

struct ContactDetailActionButton: View {
    let contact: Contact
    let actionType: ContactDetailAction
    @State private var isTapped: Bool = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 6) {
            Image(actionType.imageName)
            
            switch actionType {
            case .message(let isEnabled):
                Text("message")
                    .font(.system(size: 11))
                    .foregroundColor(isEnabled ? .trettaGold : .white.opacity(0.3))
                    .padding(.bottom, 2)
            case .call(let isEnabled):
                Text("call")
                    .font(.system(size: 11))
                    .foregroundColor(isEnabled ? .trettaGold : .white.opacity(0.3))
                    .padding(.bottom, 2)
            case .mail(let isEnabled):
                Text("mail")
                    .font(.system(size: 11))
                    .foregroundColor(isEnabled ? .trettaGold : .white.opacity(0.3))
                    .padding(.bottom, 2)
            }
        }
        .frame(width: 86, height: 52)
        .background(Color.homeBodySectionBlue)
        .cornerRadius(8)
        .onTapGesture {
            if case .call = actionType,
                let url = URL(string: "tel://\(contact.phone)"),
                UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                isTapped.toggle()
            }
        }
        .sheet(isPresented: $isTapped) {
            switch actionType {
            case .message, .call:
                MessageView(contactNumber: contact.phone)
            case .mail:
                MailView(contactEmail: contact.email ?? "")
            }
        }
    }
}

//struct ContactDetailActionButton_Previews: PreviewProvider {
//    static var previews: some View {
//        ContactDetailActionButton(actionType: .call(isEnabled: true))
//    }
//}
