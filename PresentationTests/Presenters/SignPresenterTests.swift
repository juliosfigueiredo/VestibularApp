//
//  PresentationTests.swift
//  PresentationTests
//
//  Created by Julio Figueiredo on 16/05/20.
//  Copyright © 2020 Julio Figueiredo. All rights reserved.
//

import XCTest
import Presentation

class SignPresenterTests: XCTestCase {
    func test_signUp_should_show_error_message_if_cpf_is_not_provider() {
        let (sut, alertViewSpy) = makeSut()
        let signUpViewModel = SignViewModel(name: "any_name", dataNascimento: "any_nascimento", anoConclusaoEnsinoMedio: 2020, email: "any_email@mail.com", password: "any_password", passwordConfirmation: "any_password")
        sut.signUp(viewModel: signUpViewModel)
        XCTAssertEqual(alertViewSpy.viewModel, AlertViewModel(title: "Falha na validação", message: "O campo cpf é obrigatorio"))
    }
    
    func test_signUp_should_show_error_message_if_name_is_not_provider() {
        let (sut, alertViewSpy) = makeSut()
        let signUpViewModel = SignViewModel(cpf: "any_cpf", dataNascimento: "any_nascimento", anoConclusaoEnsinoMedio: 2020, email: "any_email@mail.com", password: "any_password", passwordConfirmation: "any_password")
        sut.signUp(viewModel: signUpViewModel)
        XCTAssertEqual(alertViewSpy.viewModel, AlertViewModel(title: "Falha na validação", message: "O campo nome é obrigatorio"))
    }
    
    func test_signUp_should_show_error_message_if_email_is_not_provider() {
        let (sut, alertViewSpy) = makeSut()
        let signUpViewModel = SignViewModel(cpf: "any_cpf", name: "any_name", dataNascimento: "any_nascimento", anoConclusaoEnsinoMedio: 2020, password: "any_password", passwordConfirmation: "any_password")
        sut.signUp(viewModel: signUpViewModel)
        XCTAssertEqual(alertViewSpy.viewModel, AlertViewModel(title: "Falha na validação", message: "O campo email é obrigatorio"))
    }
    
    func test_signUp_should_show_error_message_if_password_is_not_provider() {
        let (sut, alertViewSpy) = makeSut()
        let signUpViewModel = SignViewModel(cpf: "any_cpf", name: "any_name", dataNascimento: "any_nascimento", anoConclusaoEnsinoMedio: 2020, email: "any_email@mail.com", passwordConfirmation: "any_password")
        sut.signUp(viewModel: signUpViewModel)
        XCTAssertEqual(alertViewSpy.viewModel, AlertViewModel(title: "Falha na validação", message: "O campo senha é obrigatorio"))
    }
    
    func test_signUp_should_show_error_message_if_password_confirmatio_is_not_provider() {
        let (sut, alertViewSpy) = makeSut()
        let signUpViewModel = SignViewModel(cpf: "any_cpf", name: "any_name", dataNascimento: "any_nascimento", anoConclusaoEnsinoMedio: 2020, email: "any_email@mail.com", password: "any_password")
        sut.signUp(viewModel: signUpViewModel)
        XCTAssertEqual(alertViewSpy.viewModel, AlertViewModel(title: "Falha na validação", message: "O campo confirmar senha é obrigatorio"))
    }
}

extension SignPresenterTests {
    func makeSut() -> (sut: SignPresenter, alertViewSpy: AlertViewSpy) {
        let alertViewSpy = AlertViewSpy()
        let sut = SignPresenter(alertView: alertViewSpy)
        return (sut, alertViewSpy)
    }
    
    class AlertViewSpy: AlertView {
        var viewModel: AlertViewModel?
        
        func showMessage(viewModel: AlertViewModel) {
            self.viewModel = viewModel
        }
    }
}
