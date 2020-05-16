//
//  SignPresenter.swift
//  Presentation
//
//  Created by Julio Figueiredo on 16/05/20.
//  Copyright © 2020 Julio Figueiredo. All rights reserved.
//

import Foundation

public final class SignPresenter {
    private let alertView: AlertView
    
    public init(alertView: AlertView) {
        self.alertView = alertView
    }
    
    public func signUp(viewModel: SignViewModel) {
        if let message = validate(viewModel: viewModel) {
            alertView.showMessage(viewModel: AlertViewModel(title: "Falha na validação", message: message))
        }
    }
    
    private func validate(viewModel: SignViewModel) -> String? {
        if viewModel.cpf == nil || viewModel.cpf!.isEmpty {
            return "O campo cpf é obrigatorio"
        } else if viewModel.name == nil || viewModel.name!.isEmpty {
            return "O campo nome é obrigatorio"
        } else if viewModel.email == nil || viewModel.email!.isEmpty {
            return "O campo email é obrigatorio"
        } else if viewModel.password == nil || viewModel.password!.isEmpty {
            return "O campo senha é obrigatorio"
        } else if viewModel.passwordConfirmation == nil || viewModel.passwordConfirmation!.isEmpty {
            return "O campo confirmar senha é obrigatorio"
        } else if viewModel.password != viewModel.passwordConfirmation {
            return "Falha ao confirmar senha"
        }
        return nil
    }
}

public struct SignViewModel {
    public var cpf: String?
    public var name: String?
    public var dataNascimento: String?
    public var anoConclusaoEnsinoMedio: Int64?
    public var email: String?
    public var password: String?
    public var passwordConfirmation: String?
    
    public init(cpf: String? = nil, name: String? = nil, dataNascimento: String? = nil, anoConclusaoEnsinoMedio: Int64? = nil, email: String? = nil, password: String? = nil, passwordConfirmation: String? = nil) {
        self.cpf = cpf
        self.name = name
        self.dataNascimento = dataNascimento
        self.anoConclusaoEnsinoMedio = anoConclusaoEnsinoMedio
        self.email = email
        self.password = password
        self.passwordConfirmation = passwordConfirmation
    }
}
