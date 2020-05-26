//
//  LoginViewModel.swift
//  Presentation
//
//  Created by Julio Figueiredo on 25/05/20.
//  Copyright © 2020 Julio Figueiredo. All rights reserved.
//

import Foundation
import Domain

public struct LoginViewModel: Model {
    public var cpf: String?
    public var password: String?
    
    public init(cpf: String? = nil, password: String? = nil) {
        self.cpf = cpf
        self.password = password
    }
    
    public func toAuthenticationModel() -> AuthenticationModel {
        return AuthenticationModel(cpf: cpf!, password: password!)
    }
}
