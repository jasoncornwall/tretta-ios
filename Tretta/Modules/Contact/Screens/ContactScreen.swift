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
    @State private var presentedSheet: ContactSheet?
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                    .frame(height: 1)
//                ContactHeader()
//                    .padding(.bottom, 8)
                if !model.contacts.isEmpty {
                    ContactList(contacts: $model.contacts)
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
                        presentedSheet = .createContact
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
            model.loadContacts { result in
                if case let .failure(error) = result {
                    print(error)
                }
            }
        }
        .sheet(item: $presentedSheet) { sheet in
            switch sheet {
            case .createContact:
                CreateContactScreen(model: CreateContactScreenModel())
            }
        }
    }
}

//struct ContactScreen_Previews: PreviewProvider {
//    @State private static var initialRoute: Route = .contact(.main)
//    static var previews: some View {
//        ContactScreen(route: $initialRoute)
//    }
//}
