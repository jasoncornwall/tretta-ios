//
//  User.swift
//  Tretta
//
//  Created by Jason C on 4/10/23.
//

import Foundation

struct User: Codable, CustomStringConvertible {
    let _id: String
    let email: String
    let password: String?
    let firstName: String
    let lastName: String
    let orgId: String
}
