//
//  SnakeCaseJSONDecoder.swift
//  Tretta
//
//  Created by Jason C on 4/10/23.
//

import Foundation

class SnakeCaseJSONDecoder: JSONDecoder {
    override init() {
        super.init()
        keyDecodingStrategy = .convertFromSnakeCase
    }
}
