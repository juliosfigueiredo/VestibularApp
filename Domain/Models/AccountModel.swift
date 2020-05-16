//
//  AccountModel.swift
//  Domain
//
//  Created by Julio Figueiredo on 15/05/20.
//  Copyright © 2020 Julio Figueiredo. All rights reserved.
//

import Foundation

public struct AccountModel: Model {
    public var id: String
    public var cpf: String
    public var name: String
    public var dataNascimento: String
    public var anoConclusaoEnsinoMedio: Int64
    public var email: String
    public var password: String
    
    public init(id: String, cpf: String, name: String, dataNascimento: String, anoConclusaoEnsinoMedio: Int64, email: String, password: String) {
        self.id = id
        self.cpf = cpf
        self.name = name
        self.dataNascimento = dataNascimento
        self.anoConclusaoEnsinoMedio = anoConclusaoEnsinoMedio
        self.email = email
        self.password = password
    }
}
