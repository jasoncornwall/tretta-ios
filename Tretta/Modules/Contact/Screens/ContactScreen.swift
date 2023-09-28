//
//  ContactScreen.swift
//  Tretta
//
//  Created by Jason C on 4/19/23.
//

import SwiftUI

struct ContactScreen: View {
    @Binding var route: Route
    @StateObject var model: ContactScreenModel
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                    .frame(height: 1)
//                ContactHeader()
//                    .padding(.bottom, 8)
                if !model.contacts.isEmpty {
                    ContactList(contacts: model.contacts)
                } else {
                    EmptyStateView(type: .contact)
                    Spacer()
                        .frame(maxWidth: .infinity)
                }
            }
            .background(Color.backgroundBlue)
            .navigationTitle("Contacts")
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
//                        let accountId = KeyStorage.shared.getStringValue(forKey: Constants.accountIdKey) ?? ""
//                        let mockContact = model.getRandomMockContact(userId: accountId)
//
//                        ContactApiService.createContact(contact: mockContact) { result in
//                            switch result {
//                            case let .success(contact):
//                                print("Created contact: \(contact)")
//                            case let .failure(error):
//                                print("Create Contact Error: \(error)")
//                            }
//                        }
                    } label: {
                        Image(systemName: "plus")
                            .foregroundColor(.trettaGold)
                    }
                }
            }
        }
        .searchable(text: $model.searchText)
        .tint(.trettaGold)
        .foregroundColor(.white)
        .task {
            model.loadContacts()
        }
    }
}

//struct ContactScreen_Previews: PreviewProvider {
//    @State private static var initialRoute: Route = .contact(.main)
//    static var previews: some View {
//        ContactScreen(route: $initialRoute)
//    }
//}
