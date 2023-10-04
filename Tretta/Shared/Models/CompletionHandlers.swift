//
//  CompletionHandlers.swift
//  Tretta
//
//  Created by Jason C on 9/17/23.
//

import Alamofire
import Foundation

typealias EmptyCompletionHandler = () -> ()
typealias StringCompletionHandler = (String?) -> ()
typealias ErrorCompletionHandler = (AFError?) -> ()

