//
//  CreateContactScreen.swift
//  Tretta
//
//  Created by Jason C on 9/28/23.
//

import SwiftUI

struct CreateContactScreen: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @StateObject var model: CreateContactScreenModel
    
    @State private var firstNameText = ""
    @State private var lastNameText = ""
    @State private var phoneNumberText = ""
    @State private var emailText = ""
    @State private var websiteText = ""
    @State private var addressLine1Text = ""
    @State private var addressLine2Text = ""
    @State private var cityText = ""
    @State private var stateText = ""
    @State private var zipCodeText = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading) {
                        Spacer()
                            .frame(height: 24)
                        Group {
                            FloatingTextField(title: "First Name", text: $firstNameText)
                                .padding(.horizontal, 32)
                                .padding(.bottom, 24)
                            FloatingTextField(title: "Last Name", text: $lastNameText)
                                .padding(.horizontal, 32)
                                .padding(.bottom, 24)
                            FloatingTextField(title: "Phone Number", text: $phoneNumberText)
                                .padding(.horizontal, 32)
                                .padding(.bottom, 24)
                            FloatingTextField(title: "Email", text: $emailText)
                                .padding(.horizontal, 32)
                                .padding(.bottom, 24)
                            FloatingTextField(title: "Website (optional)", text: $websiteText)
                                .padding(.horizontal, 32)
                                .padding(.bottom, 24)
                        }
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.white.opacity(0.3))
                            .padding(.top, 8)
                        HStack {
                            Text("Add an address (optional):")
                                .font(.system(size: 20, weight: .semibold))
                                .padding(.leading, 24)
                            Spacer()
                        }
                        .padding(.top, 24)
                        .padding(.bottom, 16)
                        Group {
                            FloatingTextField(title: "Address Line 1", text: $addressLine1Text)
                                .padding(.horizontal, 32)
                                .padding(.bottom, 24)
                            FloatingTextField(title: "Address Line 2", text: $addressLine2Text)
                                .padding(.horizontal, 32)
                                .padding(.bottom, 24)
                            FloatingTextField(title: "City", text: $cityText)
                                .padding(.horizontal, 32)
                                .padding(.bottom, 24)
                            FloatingTextField(title: "State", text: $stateText)
                                .padding(.horizontal, 32)
                                .padding(.bottom, 24)
                            FloatingTextField(title: "Zip/Postal Code", text: $zipCodeText)
                                .padding(.horizontal, 32)
                                .padding(.bottom, 24)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .navigationTitle("Create Contact")
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button {
                                dismiss()
                            } label: {
                                Image(systemName: "xmark")
                                    .foregroundColor(.trettaGold)
                            }
                        }
                    }
                    Spacer()
                }
                .background(Color.backgroundBlue)
                Button("Save New Contact") {
                    model.createContact(
                        firstName: firstNameText,
                        lastName: lastNameText,
                        phoneNumber: phoneNumberText,
                        email: emailText,
                        website: websiteText,
                        addressLine1: addressLine1Text,
                        addressLine2: addressLine2Text,
                        city: cityText,
                        state: stateText,
                        zipCode: zipCodeText) { result in
                            switch result {
                            case .success:
                                print(result)
                                dismiss()
                            case let .failure(error):
                                print("Error creating contact: \(error)")
                            }
                    }
                }
                .buttonStyle(ClearButton())
            }.background(Color.backgroundBlue)
        }
    }
}
