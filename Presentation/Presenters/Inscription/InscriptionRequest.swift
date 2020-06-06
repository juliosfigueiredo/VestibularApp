//
//  InscriptionRequest.swift
//  Presentation
//
//  Created by Julio Figueiredo on 06/06/20.
//  Copyright © 2020 Julio Figueiredo. All rights reserved.
//

import Foundation
import Domain

public struct InscriptionRequest: Model {
    public var instituto: String?
    public var cpf: String?
    public var idCampus: Int64?
    public var idCurso: Int64?
    public var idTurno: Int?
    public var redacao: String?
    
    public init(instituto: String? = nil, cpf: String? = nil, idCampus: Int64? = nil, idCurso: Int64? = nil, idTurno: Int? = nil, redacao: String? = nil) {
        self.instituto = instituto
        self.cpf = cpf
        self.idCampus = idCampus
        self.idCurso = idCurso
        self.idTurno = idTurno
        self.redacao = redacao
    }
    
    public func toAddInscriptionModel() -> AddInscriptionModel {
        return AddInscriptionModel(instituto: instituto!, cpf: cpf!, idCampus: idCampus!, idCurso: idCurso!, idTurno: idTurno!, redacao: redacao!)
    }
}
