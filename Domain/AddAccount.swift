//
//  AddAccount.swift
//  Domain
//
//  Created by Julio Figueiredo on 15/05/20.
//  Copyright © 2020 Julio Figueiredo. All rights reserved.
//

import Foundation

public protocol AddAccount {
    func add(addAccountModel: AddAccountModel, completion: @escaping (Result<AccountModel, Error>) -> Void)
}

public struct AddAccountModel {
    public var cpf: String
    public var name: String
    public var dataNascimento: String
    public var anoConclusaoEnsinoMedio: Int64
    public var email: String
    public var password: String
    public var passwordConfirmation: String
}
