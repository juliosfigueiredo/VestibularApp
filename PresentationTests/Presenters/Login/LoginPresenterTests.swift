//
//  LoginPresenterTests.swift
//  PresentationTests
//
//  Created by Julio Figueiredo on 25/05/20.
//  Copyright © 2020 Julio Figueiredo. All rights reserved.
//
import XCTest
import Presentation
import Domain

class LoginPresenterTests: XCTestCase {
    func test_login_should_call_validation_with_correct_values() {
        let validationSpy = ValidationSpy()
        let sut = makeSut(validation: validationSpy)
        let viewModel = makeLoginViewModel()
        sut.login(viewModel: viewModel)
        XCTAssertTrue(NSDictionary(dictionary: validationSpy.data!).isEqual(to: viewModel.toJson()!))
    }
    
    func test_login_should_show_error_message_if_validation_fails() {
        let alertViewSpy = AlertViewSpy()
        let validationSpy = ValidationSpy()
        let sut = makeSut(validation: validationSpy, alertView: alertViewSpy)
        let exp = expectation(description: "waiting")
        alertViewSpy.observe { (viewModel) in
            XCTAssertEqual(viewModel, AlertViewModel(title: "Falha na validação", message: "Erro"))
            exp.fulfill()
        }
        validationSpy.simulateError()
        sut.login(viewModel: makeLoginViewModel())
        wait(for: [exp], timeout: 1)
    }
    
    func test_login_should_call_authentication_with_correct_values() {
        let authenticationSpy = AuthenticationSpy()
        let sut = makeSut(authentication: authenticationSpy)
        sut.login(viewModel: makeLoginViewModel())
        XCTAssertEqual(authenticationSpy.authenticationModel, makeAuthenticationModel())
    }
    
    func test_login_should_show_generic_error_message_if_authentication_fails() {
        let alertViewSpy = AlertViewSpy()
        let authenticationSpy = AuthenticationSpy()
        let sut = makeSut(authentication: authenticationSpy, alertView: alertViewSpy)
        let exp = expectation(description: "waiting")
        alertViewSpy.observe { (viewModel) in
            XCTAssertEqual(viewModel, AlertViewModel(title: "Erro", message: "Algo inesperado aconteceu, tente novamente em alguns instantes."))
            exp.fulfill()
        }
        sut.login(viewModel: makeLoginViewModel())
        authenticationSpy.completeWithError(.unexpected)
        wait(for: [exp], timeout: 1)
    }
    
    func test_login_should_show_expired_session_error_message_if_authentication_completes_with_expired_session() {
        let alertViewSpy = AlertViewSpy()
        let authenticationSpy = AuthenticationSpy()
        let sut = makeSut(authentication: authenticationSpy, alertView: alertViewSpy)
        let exp = expectation(description: "waiting")
        alertViewSpy.observe { (viewModel) in
            XCTAssertEqual(viewModel, AlertViewModel(title: "Erro", message: "CPF e/ou senha inválido(s)."))
            exp.fulfill()
        }
        sut.login(viewModel: makeLoginViewModel())
        authenticationSpy.completeWithError(.expiredSession)
        wait(for: [exp], timeout: 1)
    }
    
    func test_login_should_show_success_message_if_authentication_succeeds() {
        let alertViewSpy = AlertViewSpy()
        let authenticationSpy = AuthenticationSpy()
        let sut = makeSut(authentication: authenticationSpy, alertView: alertViewSpy)
        let exp = expectation(description: "waiting")
        alertViewSpy.observe { (viewModel) in
            XCTAssertEqual(viewModel, AlertViewModel(title: "Sucesso", message: "Login feito com sucesso."))
            exp.fulfill()
        }
        sut.login(viewModel: makeLoginViewModel())
        authenticationSpy.completeWithAccount(makeAccountModel())
        wait(for: [exp], timeout: 1)
    }
    
    func test_login_should_show_loading_before_and_after_authentication() {
        let loadingViewSpy = LoadingViewSpy()
        let authenticationSpy = AuthenticationSpy()
        let sut = makeSut(authentication: authenticationSpy, loadingView: loadingViewSpy)
        let exp = expectation(description: "waiting")
        loadingViewSpy.observe { (viewModel) in
            XCTAssertEqual(viewModel, LoadingViewModel(isLoading: true))
            exp.fulfill()
        }
        sut.login(viewModel: makeLoginViewModel())
        wait(for: [exp], timeout: 1)
        let exp2 = expectation(description: "waiting")
        loadingViewSpy.observe { (viewModel) in
            XCTAssertEqual(viewModel, LoadingViewModel(isLoading: false))
            exp2.fulfill()
        }
        authenticationSpy.completeWithError(.unexpected)
        wait(for: [exp2], timeout: 1)
    }
}

extension LoginPresenterTests {
    func makeSut(validation: ValidationSpy = ValidationSpy(), authentication: AuthenticationSpy = AuthenticationSpy(), alertView: AlertViewSpy = AlertViewSpy(), loadingView: LoadingViewSpy = LoadingViewSpy(), file: StaticString = #file, line: UInt = #line) -> LoginPresenter {
        let sut = LoginPresenter(validation: validation, authentication: authentication, alertView: alertView, loadingView: loadingView)
        checkMemoryLeak(for: sut, file: file, line: line)
        return sut
    }
}

//alertView: alertView, addAccount: addAccount, loadingView: loadingView,

//alertView: AlertViewSpy = AlertViewSpy(), addAccount: AddAccountSpy = AddAccountSpy(), loadingView: LoadingViewSpy = LoadingViewSpy(),
