//
//  ExtensionHelpers.swift
//  Data
//
//  Created by Julio Figueiredo on 15/05/20.
//  Copyright © 2020 Julio Figueiredo. All rights reserved.
//

import Foundation

public extension Data {
    func toModel<T: Decodable>() -> T? {
        let model = try? JSONDecoder().decode(T.self, from: self)
        return model
    }
    
    func toJson() -> [String: Any]? {
        return try? JSONSerialization.jsonObject(with: self, options: .allowFragments) as? [String: Any]
    }
}
