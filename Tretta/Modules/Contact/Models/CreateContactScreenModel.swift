//
//  CreateContactScreenModel.swift
//  Tretta
//
//  Created by Jason C on 9/28/23.
//

import SwiftUI

@MainActor
class CreateContactScreenModel: ObservableObject {
    
    func createContact(
        firstName: String,
        lastName: String,
        phoneNumber: String,
        email: String,
        website: String?,
        addressLine1: String?,
        addressLine2: String?,
        city: String?,
        state: String?,
        zipCode: String?,
        completion: @escaping CreateContactCompletionHandler) {
            guard let accountId = KeyStorage.shared.getStringValue(forKey: Constants.accountIdKey) else {
                return
            }
            
            let contact = Contact(
                _id: "",
                firstName: firstName,
                lastName: lastName,
                email: email,
                website: website,
                phone: phoneNumber,
                addressLine1: addressLine1,
                addressLine2: addressLine2,
                city: city,
                state: state,
                zipcode: zipCode,
                userId: accountId
            )
            
            ContactApiService.createContact(contact: contact, completion: completion)
    }
    
}
