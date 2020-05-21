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
    func test_ui_presentation_integration() {
        debugPrint("====================")
        debugPrint(Environment.variable(.apiBaseUrl))
        debugPrint("====================")
        let sut = SignUpComposer.composeControllerWith(addAccount: AddAccountSpy())
        checkMemoryLeak(for: sut)
    }
}


