//
//  EmailValidatorSpy.swift
//  ValidationTests
//
//  Created by Julio Figueiredo on 22/05/20.
//  Copyright © 2020 Julio Figueiredo. All rights reserved.
//

import Foundation
import Validation

class EmailValidatorSpy: EmailValidator {
    var isValid = true
    var email: String?
    
    func isValid(email: String) -> Bool {
        self.email = email
        return isValid
    }
    
    func SimulateInvalidEmail() {
        isValid = false
    }
}
