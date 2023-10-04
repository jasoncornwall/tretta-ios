//
//  ContactDetailScreen.swift
//  Tretta
//
//  Created by Jason C on 4/27/23.
//

import SwiftUI

struct ContactDetailScreen: View {
    @Environment(\.dismiss) private var dismiss
    
    @StateObject var model: ContactDetailScreenModel
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    ZStack {
                        Image("")
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .frame(width: 140, height: 140)
                            .overlay(Circle().stroke(.black.opacity(0.2), lineWidth: 4))
                        Text("\(model.contact.initials)")
                            .font(.system(size: 50, weight: .bold))
                    }
                    Text("\(model.contact.firstName) \(model.contact.lastName)")
                        .font(.system(size: 32, weight: .semibold))
                        .padding(.top, 16)
                    HStack(spacing: 16) {
                        ContactDetailActionButton(actionType: .message(isEnabled: model.contact.phone != nil))
                        ContactDetailActionButton(actionType: .call(isEnabled: model.contact.phone != nil))
                        ContactDetailActionButton(actionType: .mail(isEnabled: model.contact.email != nil))
                    }
                    .padding(.top, 4)
                    ContactDetailSubSection(sectionType: .phone(model.contact.phone))
                        .padding(.top, 16)
                        .padding(.horizontal, 16)
                    if let email = model.contact.email {
                        ContactDetailSubSection(sectionType: .email(email))
                            .padding(.top, 16)
                            .padding(.horizontal, 16)
                    }
//                    ContactDetailNoteSection()
//                        .padding(.top, 16)
//                        .padding(.horizontal, 16)
//                    ContactDetailSummarySection(note: "")
//                        .padding(.top, 16)
//                        .padding(.horizontal, 16)
                    FileList()
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .background(Color.backgroundBlue)
                .padding(.top, 32)
            }
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.trettaGold)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        model.showDocumentScanner.toggle()
                    } label: {
                        Image(systemName: "doc.viewfinder")
                            .foregroundColor(.trettaGold)
                    }
                }
            }
            .background(Color.backgroundBlue)
            .toolbarBackground(.hidden, for: .navigationBar)
            .fullScreenCover(isPresented: $model.showDocumentScanner) {
                DocumentScanner { result in
                    switch result {
                    case let .success(pages):
                        print("Scanned pages: \(pages)")
                    case let .failure(error):
                        print("Error scanning documents: \(error)")
                    }
                    
                    model.showDocumentScanner.toggle()
                } didCancelScanning: {
                    model.showDocumentScanner.toggle()
                }

            }
        }
    }
}

//struct ContactDetailScreen_Previews: PreviewProvider {
//    @State private static var initialRoute: Route = .contact(.detail)
//    static var previews: some View {
//        ContactDetailScreen(route: $initialRoute)
//    }
//}
