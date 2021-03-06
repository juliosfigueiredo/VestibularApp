//
//  AddAccount.swift
//  Domain
//
//  Created by Julio Figueiredo on 15/05/20.
//  Copyright © 2020 Julio Figueiredo. All rights reserved.
//

import Foundation

public protocol AddInscription {
    typealias Result = Swift.Result<InscriptionModel, DomainError>
    func add(addInscriptionModel: AddInscriptionModel, completion: @escaping (Result) -> Void)
}

public struct AddInscriptionModel: Model {
    public var instituto: String
    public var cpf: String
    public var idCampus: Int64
    public var idCurso: Int64
    public var idTurno: Int
    public var redacao: String
    
    public init(instituto: String, cpf: String, idCampus: Int64, idCurso: Int64, idTurno: Int, redacao: String) {
        self.instituto = instituto
        self.cpf = cpf
        self.idCampus = idCampus
        self.idCurso = idCurso
        self.idTurno = idTurno
        self.redacao = redacao
    }
}
