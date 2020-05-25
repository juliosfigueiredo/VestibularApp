//
//  Authentication.swift
//  Domain
//
//  Created by Julio Figueiredo on 25/05/20.
//  Copyright © 2020 Julio Figueiredo. All rights reserved.
//

import Foundation

public protocol Authentication {
    typealias Result = Swift.Result<AccountModel, DomainError>
    func add(authenticationModel: AuthenticationModel, completion: @escaping (Result) -> Void)
}

public struct AuthenticationModel: Model {
    public var cpf: String
    public var password: String
    
    public init(cpf: String, password: String) {
        self.cpf = cpf
        self.password = password
    }
}
