//
//  SignUpIntegrationTests.swift
//  AppTests
//
//  Created by Julio Figueiredo on 21/05/20.
//  Copyright © 2020 Julio Figueiredo. All rights reserved.
//

import XCTest
import Validation
@testable import App

class LoginControllerFactoryTests: XCTestCase {
    func test_background_request_should_complete_on_main_thread() {
        //debugPrint("====================")
        //debugPrint(Environment.variable(.apiBaseUrl))
        //debugPrint("====================")
        let (sut, authenticationSpy) = makeSut()
        sut.loadViewIfNeeded()
        sut.login?(makeLoginViewModel())
        let exp = expectation(description: "waiting")
        DispatchQueue.global().async {
            authenticationSpy.completeWithError(.unexpected)
            exp.fulfill()
        }
        wait(for: [exp], timeout: 1)
    }
    
    func test_login_compose_with_correct_validations() {
        let validations = makeSignUpValidations()
        XCTAssertEqual(validations[0] as! RequiredFieldValidation, RequiredFieldValidation(fieldName: "cpf", fieldLabel: "CPF"))
        XCTAssertEqual(validations[6] as! RequiredFieldValidation, RequiredFieldValidation(fieldName: "password", fieldLabel: "Senha"))
    }
}

extension LoginControllerFactoryTests {
    func makeSut(file: StaticString = #file, line: UInt = #line) -> (sut: LoginViewController, authenticationSpy: AuthenticationSpy) {
        let authenticationSpy = AuthenticationSpy()
        let sut = makeLoginController(authentication: MainQueueDispatchDecorator(authenticationSpy))
        checkMemoryLeak(for: sut, file: file, line: line)
        checkMemoryLeak(for: authenticationSpy, file: file, line: line)
        return (sut, authenticationSpy)
    }
}


