//
//  Contact.swift
//  Tretta
//
//  Created by Jason C on 4/19/23.
//

import Foundation

struct Contact: Codable, Hashable, CustomStringConvertible {
    let _id: String
    let firstName: String
    let lastName: String
    var email: String? = nil
    var website: String? = nil
    let phone: String
    var addressLine1: String? = nil
    var addressLine2: String? = nil
    var city: String? = nil
    var state: String? = nil
    var zipcode: String? = nil
    let userId: String
    var orgId: String? = nil
}

extension Contact {
    var initials: String {
        return "\(firstName.prefix(1))\(lastName.prefix(1))"
    }
}

extension Contact: Identifiable {
    var id: String? { _id }
}
