//
//  SignPresenter.swift
//  Presentation
//
//  Created by Julio Figueiredo on 16/05/20.
//  Copyright © 2020 Julio Figueiredo. All rights reserved.
//

import Foundation
import Domain

public final class SignPresenter {
    private let alertView: AlertView
    private let emailValidator: EmailValidator
    private let addAccount: AddAccount
    
    public init(alertView: AlertView, emailValidator: EmailValidator, addAccount: AddAccount) {
        self.alertView = alertView
        self.emailValidator = emailValidator
        self.addAccount = addAccount
    }
    
    public func signUp(viewModel: SignViewModel) {
        if let message = validate(viewModel: viewModel) {
            alertView.showMessage(viewModel: AlertViewModel(title: "Falha na validação", message: message))
        } else {
            let addAccountModel = AddAccountModel(cpf: viewModel.cpf!, name: viewModel.name!, dataNascimento: viewModel.dataNascimento!, anoConclusaoEnsinoMedio: viewModel.anoConclusaoEnsinoMedio!, email: viewModel.email!, password: viewModel.password!, passwordConfirmation: viewModel.passwordConfirmation!)
            addAccount.add(addAccountModel: addAccountModel) { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .failure: self.alertView.showMessage(viewModel: AlertViewModel(title: "Erro", message: "Algo inesperado aconteceu, tente novamente em alguns instantes."))
                case .success: break
                }
            }
        }
    }
    
    private func validate(viewModel: SignViewModel) -> String? {
        if viewModel.cpf == nil || viewModel.cpf!.isEmpty {
            return "O campo Cpf é obrigatório"
        } else if viewModel.name == nil || viewModel.name!.isEmpty {
            return "O campo Nome é obrigatório"
        } else if viewModel.email == nil || viewModel.email!.isEmpty {
            return "O campo Email é obrigatório"
        } else if viewModel.password == nil || viewModel.password!.isEmpty {
            return "O campo Senha é obrigatório"
        } else if viewModel.passwordConfirmation == nil || viewModel.passwordConfirmation!.isEmpty {
            return "O campo Confirmar senha é obrigatório"
        } else if viewModel.password != viewModel.passwordConfirmation {
            return "O campo Confirmar senha é inválido"
        } else if !emailValidator.isValid(email: viewModel.email!) {
            return "O campo Email é inválido"
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
