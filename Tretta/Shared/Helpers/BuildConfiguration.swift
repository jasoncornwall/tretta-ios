//
//  BuildConfiguration.swift
//  Tretta
//
//  Created by Jason C on 10/19/23.
//

import Foundation

enum BuildEnvironment: String {
    case staging = "Staging"
    case production = "Production"
}

class BuildConfiguration {
    static let shared = BuildConfiguration()
    
    var environment: BuildEnvironment
    
    init() {
        guard let currentConfiguration = Bundle.main.object(forInfoDictionaryKey: "Configuration") as? String else {
            environment = .staging
            return
        }
        
        environment = BuildEnvironment(rawValue: currentConfiguration) ?? .staging
    }
}
