//
//  LoginViewControllerTests.swift
//  AppTests
//
//  Created by Julio Figueiredo on 26/05/20.
//  Copyright © 2020 Julio Figueiredo. All rights reserved.
//

import XCTest
import UIKit
import Presentation
@testable import App

class LoginViewControllerTests: XCTestCase {
    func test_loading_is_hidden_on_start() {
        XCTAssertEqual(makeSut().vwLoading.isHidden, true)
    }
    
    func test_sut_implements_loadingView() {
        XCTAssertNotNil(makeSut() as LoadingView)
    }
    
    func test_sut_implements_alertView() {
        XCTAssertNotNil(makeSut() as AlertView)
    }
    
    func test_loginButton_calls_login_on_tap() {
        var loginViewModel: LoginRequest?
        let sut = makeSut(loginSpy: { loginViewModel = $0 })
        sut.btEntrar?.simulateTap()
        let cpf = sut.tfCpf?.text
        let password = sut.tfSenha?.text
        XCTAssertEqual(loginViewModel, LoginRequest(cpf: cpf, password: password))
    }
}

extension LoginViewControllerTests {
    func makeSut(loginSpy: ((LoginRequest) -> Void)? = nil) -> LoginViewController {
        let sut = LoginViewController.instantiate()
        sut.login = loginSpy
        sut.loadViewIfNeeded()
        checkMemoryLeak(for: sut)
        return sut
    }
}

