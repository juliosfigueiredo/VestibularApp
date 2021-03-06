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

public func makeLoginController() -> LoginViewController {
    return makeLoginController(authentication: makeRemoteAuthentication())
}

public func makeLoginController(authentication: Authentication) -> LoginViewController {
    let controller = LoginViewController.instantiate()
    let validationComposite = ValidationComposite(validations: makeLoginValidations())
    let presenter = LoginPresenter(validation: validationComposite, authentication: authentication, alertView: WeakVarProxy(controller), loadingView: WeakVarProxy(controller))
    controller.login = presenter.login
    return controller
}

public func makeLoginValidations() -> [Validation] {
    return ValidationBuilder.field("cpf").label("CPF").required().build() +
           ValidationBuilder.field("password").label("Senha").required().build()
}
