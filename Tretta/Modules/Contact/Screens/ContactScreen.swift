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
                ContactHeader()
                    .padding(.bottom, 8)
                if !model.contacts.isEmpty {
                    ContactList(route: $route, contacts: model.contacts)
                } else {
                    EmptyStateView(type: .contact)
                    Spacer()
                }
            }
            .background(Color.backgroundBlue)
            .navigationTitle("Contacts")
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        print("Plus button tapped.")
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
    }
}

//struct ContactScreen_Previews: PreviewProvider {
//    @State private static var initialRoute: Route = .contact(.main)
//    static var previews: some View {
//        ContactScreen(route: $initialRoute)
//    }
//}
