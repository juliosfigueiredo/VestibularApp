//
//  AppTests.swift
//  AppTests
//
//  Created by Julio Figueiredo on 19/05/20.
//  Copyright © 2020 Julio Figueiredo. All rights reserved.
//

import XCTest
import UIKit
@testable import App

class SignUpViewControllerTests: XCTestCase {

    func test_loading_is_hidden_on_start() {
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle(for: SignUpViewController.self))
        let sut = storyBoard.instantiateViewController(identifier: "SignUpViewController") as! SignUpViewController
        sut.loadViewIfNeeded()
        XCTAssertEqual(sut.vwLoading.isHidden, false)
    }
}
