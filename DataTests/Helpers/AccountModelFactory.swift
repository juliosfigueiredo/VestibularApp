//
//  AccountModelFactory.swift
//  DataTests
//
//  Created by Julio Figueiredo on 15/05/20.
//  Copyright © 2020 Julio Figueiredo. All rights reserved.
//

import Foundation
import Domain

func makeAddAccountModel() -> AddAccountModel {
    return AddAccountModel(cpf: "any_cpf", name: "any_name", dataNascimento: "any_nascimento", anoConclusaoEnsinoMedio: 2020, email: "any_email@mail.com", password: "any_password", passwordConfirmation: "any_password")
}

func makeAccountModel() -> AccountModel {
    return AccountModel(id: "any_id", cpf: "any_cpf", name: "any_name", dataNascimento: "any_nascimento", anoConclusaoEnsinoMedio: 2020, email: "any_email@mail.com", password: "any_senha")
}
