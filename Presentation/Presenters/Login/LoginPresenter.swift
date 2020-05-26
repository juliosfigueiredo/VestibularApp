//
//  LoginPresenter.swift
//  Presentation
//
//  Created by Julio Figueiredo on 25/05/20.
//  Copyright © 2020 Julio Figueiredo. All rights reserved.
//

import Foundation
import Domain

public final class LoginPresenter {
    private let validation: Validation
    private let authentication: Authentication
    private let alertView: AlertView
    
    public init(validation: Validation, authentication: Authentication, alertView: AlertView) {
        self.validation = validation
        self.authentication = authentication
        self.alertView = alertView
    }
    
    public func login(viewModel: LoginViewModel) {
        if let message = validation.validate(data: viewModel.toJson()) {
            alertView.showMessage(viewModel: AlertViewModel(title: "Falha na validação", message: message))
        } else {
            authentication.auth(authenticationModel: viewModel.toAuthenticationModel()) { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .failure: self.alertView.showMessage(viewModel: AlertViewModel(title: "Erro", message: "Algo inesperado aconteceu, tente novamente em alguns instantes."))
                case.success: break
                }
            }
        }
    }
}

