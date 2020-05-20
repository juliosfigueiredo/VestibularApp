//
//  AppTests.swift
//  AppTests
//
//  Created by Julio Figueiredo on 19/05/20.
//  Copyright © 2020 Julio Figueiredo. All rights reserved.
//

import XCTest
import UIKit
import Presentation
@testable import App

class SignUpViewControllerTests: XCTestCase {
    func test_loading_is_hidden_on_start() {
        XCTAssertEqual(makeSut().vwLoading.isHidden, false)
    }
    
    func test_sut_implements_loadingView() {
        XCTAssertNotNil(makeSut() as LoadingView)
    }
    
    func test_sut_implements_alertView() {
        XCTAssertNotNil(makeSut() as AlertView)
    }
    
    func test_saveButton_calls_signUp_on_tap() {
        var callCount = 0
        let sut = makeSut(signUpSpy: { _ in
            callCount += 1
        })
        sut.btEntrar?.simulateTap()
        XCTAssertEqual(callCount, 1)
    }
}

extension SignUpViewControllerTests {
    func makeSut(signUpSpy: ((SignViewModel) -> Void)? = nil) -> SignUpViewController {
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle(for: SignUpViewController.self))
        let sut = storyBoard.instantiateViewController(identifier: "SignUpViewController") as! SignUpViewController
        sut.signUp = signUpSpy
        sut.loadViewIfNeeded()
        return sut
    }
}

extension UIControl {
    func simulate(event: UIControl.Event) {
        allTargets.forEach { (target) in
            actions(forTarget: target, forControlEvent: event)?.forEach({ (action) in
                (target as NSObject).perform(Selector(action))
            })
        }
    }
    
    func simulateTap() {
        simulate(event: .touchUpInside)
    }
}
