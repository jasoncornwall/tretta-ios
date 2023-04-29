//
//  ContactDetailScreen.swift
//  Tretta
//
//  Created by Jason C on 4/27/23.
//

import SwiftUI

struct ContactDetailScreen: View {
    let contact: Contact
    @Binding var route: Route
    
    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "circle")
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: 140, height: 140)
                    .padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15))
                Text("\(contact.firstName) \(contact.lastName)")
                    .font(.system(size: 32, weight: .semibold))
                    .padding(.top, 24)
                HStack(spacing: 16) {
                    ContactDetailActionButton(actionType: .message(isEnabled: contact.phoneNumber != nil))
                    ContactDetailActionButton(actionType: .call(isEnabled: contact.phoneNumber != nil))
                    ContactDetailActionButton(actionType: .mail(isEnabled: contact.email != nil))
                }
                .padding(.top, 16)
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .background(Color.backgroundBlue)
            .padding(.top, 32)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        route = .rootMain(1)
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.trettaGold)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        withAnimation {
                            print("Edit tapped")
                        }
                    } label: {
                        Text("Edit")
                            .foregroundColor(.trettaGold)
                    }
                }
            }
            .background(Color.backgroundBlue)
        }
    }
}

//struct ContactDetailScreen_Previews: PreviewProvider {
//    @State private static var initialRoute: Route = .contact(.detail)
//    static var previews: some View {
//        ContactDetailScreen(route: $initialRoute)
//    }
//}
