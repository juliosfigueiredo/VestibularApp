//
//  PresentationTests.swift
//  PresentationTests
//
//  Created by Julio Figueiredo on 16/05/20.
//  Copyright © 2020 Julio Figueiredo. All rights reserved.
//

import XCTest

class SignPresenter {
    private let alertView: AlertView
    
    init(alertView: AlertView) {
        self.alertView = alertView
    }
    
    func signUp(viewModel: SignViewModel) {
        if viewModel.cpf == nil || viewModel.cpf!.isEmpty {
            alertView.showMessage(viewModel: AlertViewModel(title: "Falha na validação", message: "O campo cpf é obrigatorio"))
        } else if viewModel.name == nil || viewModel.name!.isEmpty {
            alertView.showMessage(viewModel: AlertViewModel(title: "Falha na validação", message: "O campo nome é obrigatorio"))
        }
    }
}

protocol AlertView {
    func showMessage(viewModel: AlertViewModel)
}

struct AlertViewModel: Equatable {
    var title: String
    var message: String
}

struct SignViewModel {
    var cpf: String?
    var name: String?
    var dataNascimento: String?
    var anoConclusaoEnsinoMedio: Int64?
    var email: String?
    var password: String?
    var passwordConfirmation: String?
}

class SignPresenterTests: XCTestCase {
    func test_signUp_should_show_error_message_if_cpf_is_not_provider() {
        let alertViewSpy = AlertViewSpy()
        let sut = SignPresenter(alertView: alertViewSpy)
        let signUpViewModel = SignViewModel(name: "any_name", dataNascimento: "any_nascimento", anoConclusaoEnsinoMedio: 2020, email: "any_email@mail.com", password: "any_password", passwordConfirmation: "any_password")
        sut.signUp(viewModel: signUpViewModel)
        XCTAssertEqual(alertViewSpy.viewModel, AlertViewModel(title: "Falha na validação", message: "O campo cpf é obrigatorio"))
    }
    
    func test_signUp_should_show_error_message_if_name_is_not_provider() {
        let alertViewSpy = AlertViewSpy()
        let sut = SignPresenter(alertView: alertViewSpy)
        let signUpViewModel = SignViewModel(cpf: "any_cpf", dataNascimento: "any_nascimento", anoConclusaoEnsinoMedio: 2020, email: "any_email@mail.com", password: "any_password", passwordConfirmation: "any_password")
        sut.signUp(viewModel: signUpViewModel)
        XCTAssertEqual(alertViewSpy.viewModel, AlertViewModel(title: "Falha na validação", message: "O campo nome é obrigatorio"))
    }
}

extension SignPresenterTests {
    class AlertViewSpy: AlertView {
        var viewModel: AlertViewModel?
        
        func showMessage(viewModel: AlertViewModel) {
            self.viewModel = viewModel
        }
    }
}
