//
//  ContactDetailSummarySection.swift
//  Tretta
//
//  Created by Jason C on 4/28/23.
//

import SwiftUI

struct ContactDetailSummarySection: View {
    @State var note: String

    var body: some View {
        VStack(alignment: .leading) {
            Text("Summary")
                .font(.system(size: 12))
                .foregroundColor(.white)
                .padding(.leading, 8)
                .padding(.top, 8)
            TextField("We'll let you know when we have something.", text: $note, axis: .vertical)
                .textFieldStyle(.plain)
                .tint(.trettaGold)
                .font(.system(size: 13))
                .padding(.leading, 8)
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(height: 100)
        .background(Color.homeBodySectionBlue)
        .cornerRadius(8)
    }
}
