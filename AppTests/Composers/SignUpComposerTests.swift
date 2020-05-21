//
//  SignUpIntegrationTests.swift
//  AppTests
//
//  Created by Julio Figueiredo on 21/05/20.
//  Copyright © 2020 Julio Figueiredo. All rights reserved.
//

import XCTest
@testable import App

class SignUpComposerTests: XCTestCase {
    func test_background_request_should_complete_on_main_thread() {
        //debugPrint("====================")
        //debugPrint(Environment.variable(.apiBaseUrl))
        //debugPrint("====================")
        let (sut, _) = makeSut()
        sut.loadViewIfNeeded()
        DispatchQueue.global().async {
            
        }
    }
}

extension SignUpComposerTests {
    func makeSut(file: StaticString = #file, line: UInt = #line) -> (sut: SignUpViewController, addAccountSpy: AddAccountSpy) {
        let addAccountSpy = AddAccountSpy()
        let sut = SignUpComposer.composeControllerWith(addAccount: addAccountSpy)
        checkMemoryLeak(for: sut, file: file, line: line)
        checkMemoryLeak(for: addAccountSpy, file: file, line: line)
        return (sut, addAccountSpy)
    }
}


