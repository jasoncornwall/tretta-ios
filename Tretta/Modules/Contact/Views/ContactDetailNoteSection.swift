//
//  ContactDetailNoteSection.swift
//  Tretta
//
//  Created by Jason C on 4/28/23.
//

import SwiftUI

struct ContactDetailNoteSection: View {
    @State var note: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Notes")
                .font(.system(size: 12))
                .foregroundColor(.white)
                .padding(.leading, 8)
                .padding(.top, 8)
            TextField("What are your thoughts?...", text: $note, axis: .vertical)
                .textFieldStyle(.plain)
                .tint(.trettaGold)
                .font(.system(size: 13))
                .padding(.leading, 8)
                .padding(.top, 4)
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(height: 75)
        .background(Color.homeBodySectionBlue)
        .cornerRadius(8)
    }
}
