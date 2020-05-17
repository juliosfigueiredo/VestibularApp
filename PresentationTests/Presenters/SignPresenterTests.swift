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
        let (sut, alertViewSpy, _) = makeSut()
        let signUpViewModel = SignViewModel(name: "any_name", dataNascimento: "any_nascimento", anoConclusaoEnsinoMedio: 2020, email: "any_email@mail.com", password: "any_password", passwordConfirmation: "any_password")
        sut.signUp(viewModel: signUpViewModel)
        XCTAssertEqual(alertViewSpy.viewModel, AlertViewModel(title: "Falha na validação", message: "O campo cpf é obrigatorio"))
    }
    
    func test_signUp_should_show_error_message_if_name_is_not_provider() {
        let (sut, alertViewSpy, _) = makeSut()
        let signUpViewModel = SignViewModel(cpf: "any_cpf", dataNascimento: "any_nascimento", anoConclusaoEnsinoMedio: 2020, email: "any_email@mail.com", password: "any_password", passwordConfirmation: "any_password")
        sut.signUp(viewModel: signUpViewModel)
        XCTAssertEqual(alertViewSpy.viewModel, AlertViewModel(title: "Falha na validação", message: "O campo nome é obrigatorio"))
    }
    
    func test_signUp_should_show_error_message_if_email_is_not_provider() {
        let (sut, alertViewSpy, _) = makeSut()
        let signUpViewModel = SignViewModel(cpf: "any_cpf", name: "any_name", dataNascimento: "any_nascimento", anoConclusaoEnsinoMedio: 2020, password: "any_password", passwordConfirmation: "any_password")
        sut.signUp(viewModel: signUpViewModel)
        XCTAssertEqual(alertViewSpy.viewModel, AlertViewModel(title: "Falha na validação", message: "O campo email é obrigatorio"))
    }
    
    func test_signUp_should_show_error_message_if_password_is_not_provider() {
        let (sut, alertViewSpy, _) = makeSut()
        let signUpViewModel = SignViewModel(cpf: "any_cpf", name: "any_name", dataNascimento: "any_nascimento", anoConclusaoEnsinoMedio: 2020, email: "any_email@mail.com", passwordConfirmation: "any_password")
        sut.signUp(viewModel: signUpViewModel)
        XCTAssertEqual(alertViewSpy.viewModel, AlertViewModel(title: "Falha na validação", message: "O campo senha é obrigatorio"))
    }
    
    func test_signUp_should_show_error_message_if_password_confirmatio_is_not_provider() {
        let (sut, alertViewSpy, _) = makeSut()
        let signUpViewModel = SignViewModel(cpf: "any_cpf", name: "any_name", dataNascimento: "any_nascimento", anoConclusaoEnsinoMedio: 2020, email: "any_email@mail.com", password: "any_password")
        sut.signUp(viewModel: signUpViewModel)
        XCTAssertEqual(alertViewSpy.viewModel, AlertViewModel(title: "Falha na validação", message: "O campo confirmar senha é obrigatorio"))
    }
    
    func test_signUp_should_show_error_message_if_password_confirmatio_is_not_match() {
        let (sut, alertViewSpy, _) = makeSut()
        let signUpViewModel = SignViewModel(cpf: "any_cpf", name: "any_name", dataNascimento: "any_nascimento", anoConclusaoEnsinoMedio: 2020, email: "any_email@mail.com", password: "any_password", passwordConfirmation: "wrong_password")
        sut.signUp(viewModel: signUpViewModel)
        XCTAssertEqual(alertViewSpy.viewModel, AlertViewModel(title: "Falha na validação", message: "Falha ao confirmar senha"))
    }
    
    func test_signUp_should_call_emailValidator_with_correct_email() {
        let (sut, _ , emailValidatorSpy) = makeSut()
        let signUpViewModel = SignViewModel(cpf: "any_cpf", name: "any_name", dataNascimento: "any_nascimento", anoConclusaoEnsinoMedio: 2020, email: "invalid_email@mail.com", password: "any_password", passwordConfirmation: "any_password")
        sut.signUp(viewModel: signUpViewModel)
        XCTAssertEqual(emailValidatorSpy.email, signUpViewModel.email)
    }
}

extension SignPresenterTests {
    func makeSut() -> (sut: SignPresenter, alertViewSpy: AlertViewSpy, emailValidatorSpy: EmailValidatorSpy) {
        let alertViewSpy = AlertViewSpy()
        let emailValidatorSpy = EmailValidatorSpy()
        let sut = SignPresenter(alertView: alertViewSpy, emailValidator: emailValidatorSpy)
        return (sut, alertViewSpy, emailValidatorSpy)
    }
    
    class AlertViewSpy: AlertView {
        var viewModel: AlertViewModel?
        
        func showMessage(viewModel: AlertViewModel) {
            self.viewModel = viewModel
        }
    }
    
    class EmailValidatorSpy: EmailValidator {
        var isValid = true
        var email: String?
        
        func isValid(email: String) -> Bool {
            self.email = email
            return isValid
        }
    }
}
