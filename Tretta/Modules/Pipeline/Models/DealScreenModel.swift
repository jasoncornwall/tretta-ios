//
//  DealScreenModel.swift
//  Tretta
//
//  Created by Jason C on 10/12/23.
//

import Files
import SwiftUI

class DealScreenModel: ObservableObject {
    
    @Published var sectionSelection: Int = 0
    private let sections = ["Room Scans", "Details"]
    private let notes = [
        "Meeting established to discuss potential product integrations. Relevant stakeholders looped in.",
        "15 sales reps will be added to the roster next month and 5 engineers will be added next quarter."
    ]
    
    @Published var deal: Deal
    @Published var stageName: String
    @Published var showRoomScanner: Bool
    
    init(deal: Deal, stageName: String) {
        self.deal = deal
        self.stageName = stageName
        self.showRoomScanner = false
    }
}
