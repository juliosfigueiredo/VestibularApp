//
//  AddAccount.swift
//  Domain
//
//  Created by Julio Figueiredo on 15/05/20.
//  Copyright © 2020 Julio Figueiredo. All rights reserved.
//

import Foundation

protocol AddAccount {
    func add(addAccountModel: AddAccountModel, completion: @escaping (Result<AccountModel, Error>) -> Void)
}

struct AddAccountModel {
    var cpf: String
    var name: String
    var dataNascimento: String
    var anoConclusaoEnsinoMedio: Int64
    var email: String
    var password: String
    var passwordConfirmation: String
}
