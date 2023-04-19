//
//  Contact.swift
//  Tretta
//
//  Created by Jason C on 4/19/23.
//

import Foundation

struct Contact: Codable, Hashable {
    let firstName: String
    let lastName: String
    let email: String?
    let website: String?
    let phoneNumber: String?
    let addressLine1: String?
    let addressLine2: String?
    let city: String?
    let state: String?
    let zipCode: String?
    let userId: String
    let orgId: String?
}
