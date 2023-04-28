//
//  ContactScreen.swift
//  Tretta
//
//  Created by Jason C on 4/19/23.
//

import SwiftUI

struct ContactScreen: View {
    @Binding var route: Route
    @State private var searchText = ""
    
    @State private var contacts = ContactMockData.contacts
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                    .frame(height: 1)
                ContactHeader()
                    .padding(.bottom, 8)
                ContactList(route: $route, contacts: contacts)
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
        .searchable(text: $searchText)
        .tint(.trettaGold)
        .foregroundColor(.white)
    }
}

struct ContactScreen_Previews: PreviewProvider {
    @State private static var initialRoute: Route = .contact(.main)
    static var previews: some View {
        ContactScreen(route: $initialRoute)
    }
}
