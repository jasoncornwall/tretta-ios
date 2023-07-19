//
//  KeyStorage.swift
//  Tretta
//
//  Created by Jason C on 7/18/23.
//

import Foundation
import KeychainAccess

class KeyStorage {
    static let shared = KeyStorage()
    private init() {}
    
    private let keychain = Keychain(service: Constants.keychainService)
    
    func set(_ value: String, forKey key: String) {
        do {
            try keychain.set(value, key: key)
        } catch {
            print("Error saving \(key) to keychain: \(error)")
        }
    }
    
    func getStringValue(forKey key: String) -> String? {
        return try? keychain.get(key)
    }
    
    func clearValue(forKey key: String) {
        do {
            try keychain.remove(key)
        } catch {
            print("Error removing \(key) from keychain: \(error)")
        }
    }
}
