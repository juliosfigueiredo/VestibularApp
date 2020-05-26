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
}

extension LoginViewControllerTests {
    func makeSut() -> LoginViewController {
        let sut = LoginViewController.instantiate()
        sut.loadViewIfNeeded()
        return sut
    }
}

