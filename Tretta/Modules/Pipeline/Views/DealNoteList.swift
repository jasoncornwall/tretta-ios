//
//  DealNoteList.swift
//  Tretta
//
//  Created by Jason C on 6/4/23.
//

import SwiftUI

struct DealNoteList: View {
    let notes: [String]
    
    var body: some View {
        if !notes.isEmpty {
            List {
                ForEach(Array(notes.enumerated()), id: \.element) { index, note in
                    NoteRow(note: note)
                        .padding(.bottom, 14)
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets())
                }
                .background(Color.backgroundBlue)
            }.listStyle(.plain)
        } else {
            EmptyStateView(type: .note)
                .padding(.bottom, 48)
        }
    }
}
