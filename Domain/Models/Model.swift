//
//  Model.swift
//  Domain
//
//  Created by Julio Figueiredo on 15/05/20.
//  Copyright © 2020 Julio Figueiredo. All rights reserved.
//

import Foundation

public protocol Model: Codable, Equatable {}

public extension Model {
    func toData() -> Data? {
        return try? JSONEncoder().encode(self)
    }
}
