//
//  ContactDetailSubSection.swift
//  Tretta
//
//  Created by Jason C on 4/28/23.
//

import SwiftUI

struct ContactDetailSubSection: View {
    let sectionType: SubSection
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(sectionType.label)
                .font(.system(size: 12))
                .foregroundColor(.white)
                .padding(.leading, 8)
            Text(sectionType.value)
                .font(.system(size: 13))
                .foregroundColor(.trettaGold)
                .padding(.leading, 8)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(height: 50)
        .background(Color.homeBodySectionBlue)
        .cornerRadius(8)
    }
}

extension ContactDetailSubSection {
    enum SubSection {
        case phone(String)
        case email(String)
        
        var label: String {
            switch self {
            case .phone:
                return "Phone"
            case .email:
                return "Email"
            }
        }
        
        var value: String {
            switch self {
            case let .phone(number):
                return number
            case let .email(address):
                return address
            }
        }
    }
}
