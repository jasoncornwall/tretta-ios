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
    var zipCode: String? = nil
    let userId: String
    var orgId: String? = nil
}
