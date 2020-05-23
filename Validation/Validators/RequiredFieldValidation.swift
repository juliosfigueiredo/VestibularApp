//
//  RequiredFieldValidation.swift
//  Validation
//
//  Created by Julio Figueiredo on 22/05/20.
//  Copyright © 2020 Julio Figueiredo. All rights reserved.
//

import Foundation
import Presentation

public final class RequiredFieldValidation: Validation, Equatable {
    
    private let fieldName: String
    private let fieldLabel: String
    
    public init(fieldName: String, fieldLabel: String) {
        self.fieldName = fieldName
        self.fieldLabel = fieldLabel
    }
    
    public func validate(data: [String : Any]?) -> String? {
        guard let fieldName = data?[fieldName] as? String, !fieldName.isEmpty else { return "O campo \(fieldLabel) é obrigatório." }
        return nil
    }
    
    public static func == (lhs: RequiredFieldValidation, rhs: RequiredFieldValidation) -> Bool {
        return lhs.fieldLabel == rhs.fieldLabel && lhs.fieldName == rhs.fieldName
    }
}
