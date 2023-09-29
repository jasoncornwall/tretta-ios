//
//  CreateDealScreen.swift
//  Tretta
//
//  Created by Jason C on 9/24/23.
//

import SwiftUI

struct CreateDealScreen: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @StateObject var model: CreateDealScreenModel
    
    @State private var dealNameText = ""
    @State private var dealValueText = ""
    @State private var selectedStage: Stage?
    @State private var selectedContact: Contact?
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading) {
                        Spacer()
                            .frame(height: 24)
                        FloatingTextField(title: "Deal Name", text: $dealNameText)
                            .padding(.horizontal, 40)
                            .padding(.bottom, 24)
                        FloatingTextField(title: "Deal Value (eg. $10,000 = 10000)", text: $dealValueText)
                            .padding(.horizontal, 40)
                        HStack {
                            Text("Select a stage to assign this deal to:")
                                .font(.system(size: 20, weight: .semibold))
                                .padding(.leading, 24)
                            Spacer()
                        }
                        .padding(.top, 48)
                        .padding(.bottom, 16)
                        if let selectedStage {
                            Text(selectedStage.name)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 4)
                                .font(.system(size: 18, weight: .regular))
                                .foregroundColor(Color.trettaGold)
                                .background(Color.homeBodySectionBlue)
                                .cornerRadius(12)
                                .frame(height: 44)
                        } else {
                            Group {
                                ForEach(model.stages, id: \._id) { stage in
                                    Text(stage.name)
                                        .padding(.horizontal, 12)
                                        .padding(.vertical, 4)
                                        .font(.system(size: 18, weight: .regular))
                                        .foregroundColor(.white)
                                        .background(Color.homeBodySectionBlue)
                                        .cornerRadius(12)
                                        .frame(height: 44)
                                        .onTapGesture {
                                            self.selectedStage = stage
                                        }
                                }
                            }
                        }
                        HStack {
                            Text("Select a contact to add to this deal:")
                                .font(.system(size: 20, weight: .semibold))
                                .padding(.leading, 24)
                            Spacer()
                        }
                        .padding(.top, 48)
                        .padding(.bottom, 16)
                        if let selectedContact {
                            Text("\(selectedContact.firstName) \(selectedContact.lastName)")
                                .padding(.horizontal, 12)
                                .padding(.vertical, 4)
                                .font(.system(size: 18, weight: .regular))
                                .foregroundColor(Color.trettaGold)
                                .background(Color.homeBodySectionBlue)
                                .cornerRadius(12)
                                .frame(height: 44)
                        } else {
                            Group {
                                ForEach(model.contacts, id: \._id) { contact in
                                    Text("\(contact.firstName) \(contact.lastName)")
                                        .padding(.horizontal, 12)
                                        .padding(.vertical, 4)
                                        .font(.system(size: 18, weight: .regular))
                                        .foregroundColor(.white)
                                        .background(Color.homeBodySectionBlue)
                                        .cornerRadius(12)
                                        .frame(height: 44)
                                        .onTapGesture {
                                            self.selectedContact = contact
                                        }
                                }
                            }
                        }
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.leading, 24)
                    .navigationTitle("Create Deal")
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
                Button("Save New Deal") {
                    model.createDeal(
                        name: dealNameText,
                        stageId: selectedStage?._id ?? "",
                        contactId: selectedContact?._id ?? "",
                        value: dealValueText) { result in
                            switch result {
                            case .success:
                                print(result)
                                dismiss()
                            case let .failure(error):
                                print("Error creating deal: \(error)")
                            }
                    }
                }
                .buttonStyle(ClearButton())
            }.background(Color.backgroundBlue)
        }
    }
}
