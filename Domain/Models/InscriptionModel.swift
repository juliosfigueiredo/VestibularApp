//
//  AccountModel.swift
//  Domain
//
//  Created by Julio Figueiredo on 15/05/20.
//  Copyright © 2020 Julio Figueiredo. All rights reserved.
//

import Foundation

public struct InscriptionModel: Model {
    public var id: String
    public var descricaoVestibular: String
    public var numero: String
    public var campus: String
    public var curso: String
    public var turno: String
    public var status: String
    public var datainscricao: String
    
    public init(id: String, descricaoVestibular: String, numero: String, campus: String, curso: String, turno: String, status: String, datainscricao: String) {
        self.id = id
        self.descricaoVestibular = descricaoVestibular
        self.numero = numero
        self.campus = campus
        self.curso = curso
        self.turno = turno
        self.status = status
        self.datainscricao = datainscricao
    }
}
