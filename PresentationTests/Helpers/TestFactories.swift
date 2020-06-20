//
//  TestFactories.swift
//  PresentationTests
//
//  Created by Julio Figueiredo on 18/05/20.
//  Copyright © 2020 Julio Figueiredo. All rights reserved.
//

import Foundation
import Presentation

func makeSignUpViewModel(cpf: String? = "any_cpf", name: String? = "any_name", dataNascimento: String? = "any_nascimento", anoConclusaoEnsinoMedio: Int64? = 2020, email: String? = "any_email@mail.com", password: String? = "any_password", passwordConfirmation: String? = "any_password") -> SignUpRequest {
    return SignUpRequest(cpf: cpf, name: name, dataNascimento: dataNascimento, anoConclusaoEnsinoMedio: anoConclusaoEnsinoMedio, email: email, password: password, passwordConfirmation: passwordConfirmation)
}

func makeLoginViewModel(cpf: String? = "any_cpf", password: String? = "any_password") -> LoginRequest {
    return LoginRequest(cpf: cpf, password: password)
}

func makeInscriptionViewModel(instituto: String? = "any_instituto", cpf: String? = "any_cpf", idCampus: Int64? = 0, idCurso: Int64? = 0, idTurno: Int? = 0, redacao: String? = "any_redacao") -> InscriptionRequest {
    return InscriptionRequest(instituto: instituto, cpf: cpf, idCampus: idCampus, idCurso: idCurso, idTurno: idTurno, redacao: redacao)
}
