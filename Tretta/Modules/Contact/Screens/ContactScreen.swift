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
    @State private var loadingState: LoadingState = .loading
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                    .frame(height: 1)
//                ContactHeader()
//                    .padding(.bottom, 8)
                switch loadingState {
                case .loading:
                    ProgressView()
                        .controlSize(.large)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                case .empty:
                    EmptyStateView(type: .contact)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .padding(.bottom, 200)
                case .complete:
                    ContactList(contacts: model.contacts, contactListCopy: model.contacts)
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
        .tint(.trettaGold)
        .foregroundColor(.white)
        .task {
            model.refreshContacts { error in
                if let error, let statusCode = error.responseCode, statusCode == 500 || statusCode == 401 {
                    // Logout and clear access token/accountId for 401/500 response codes
                    KeyStorage.shared.clearValue(forKey: Constants.accessToken)
                    KeyStorage.shared.clearValue(forKey: Constants.accountIdKey)
                    route = .onboarding(.signIn)
                } else {
                    loadingState = !model.contacts.isEmpty ? .complete : .empty
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
