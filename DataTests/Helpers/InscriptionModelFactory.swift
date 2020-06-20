//
//  InscriptionModelFactory.swift
//  DataTests
//
//  Created by Julio Figueiredo on 04/06/20.
//  Copyright © 2020 Julio Figueiredo. All rights reserved.
//

import Foundation
import Domain

func makeAddInscriptionModel() -> AddInscriptionModel {
    return AddInscriptionModel(instituto: "any_instituto", cpf: "any_cpf", idCampus: 0, idCurso: 0, idTurno: 0, redacao: "any_redacao")
}

func makeInscriptionModel() -> InscriptionModel {
    return InscriptionModel(id: "any_id", descricaoVestibular: "any_descricao", numero: "any_numero", campus: "any_campus", curso: "any_curso", turno: "any_turno", status: "any_turno", datainscricao: "any_data")
}
