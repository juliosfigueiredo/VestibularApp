//
//  SignUpComposer.swift
//  App
//
//  Created by Julio Figueiredo on 21/05/20.
//  Copyright © 2020 Julio Figueiredo. All rights reserved.
//

import Foundation
import Presentation
import Validation
import Domain
import Infra

public final class SignUpComposer {
    public static func composeControllerWith(addAccount: AddAccount) -> SignUpViewController {
        let controller = SignUpViewController.instantiate()
        let validationComposite = ValidationComposite(validations: makeValidations())
        let presenter = SignPresenter(alertView: WeakVarProxy(controller), addAccount: addAccount, loadingView: WeakVarProxy(controller), validation: validationComposite)
        controller.signUp = presenter.signUp
        return controller
    }
    
    public static func makeValidations() -> [Validation] {
        return [
            RequiredFieldValidation(fieldName: "cpf", fieldLabel: "CPF"),
            RequiredFieldValidation(fieldName: "name", fieldLabel: "Nome"),
            RequiredFieldValidation(fieldName: "email", fieldLabel: "Email"),
            EmailValidation(fieldName: "email", fieldLabel: "Email", emailValidator: EmailValidatorAdapter()),
            RequiredFieldValidation(fieldName: "dataNascimento", fieldLabel: "Data de Nascimento"),
            RequiredFieldValidation(fieldName: "anoConclusaoEnsinoMedio", fieldLabel: "Ano de conclusão do ensino médio"),
            RequiredFieldValidation(fieldName: "password", fieldLabel: "Senha"),
            RequiredFieldValidation(fieldName: "passwordConfirmation", fieldLabel: "Confirmar senha"),
            CompareFieldsValidation(fieldName: "password", fieldNameToCompare: "passwordConfirmation", fieldLabel: "Confirmar senha")
        ]
    }
}
