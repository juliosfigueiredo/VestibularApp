//
//  Validation.swift
//  Presentation
//
//  Created by Julio Figueiredo on 21/05/20.
//  Copyright © 2020 Julio Figueiredo. All rights reserved.
//

import Foundation

public protocol Validation {
    func validate(data: [String: Any]?) -> String?
}
