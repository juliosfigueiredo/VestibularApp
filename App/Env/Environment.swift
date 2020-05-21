//
//  Environment.swift
//  App
//
//  Created by Julio Figueiredo on 21/05/20.
//  Copyright © 2020 Julio Figueiredo. All rights reserved.
//

import Foundation

final class Environment {
    enum EnvironmentVariables: String {
        case apiBaseUrl = "API_BASE_URL"
    }
    
    static func variable(_ key: EnvironmentVariables) -> String {
        return Bundle.main.infoDictionary![key.rawValue] as! String
    }
}
