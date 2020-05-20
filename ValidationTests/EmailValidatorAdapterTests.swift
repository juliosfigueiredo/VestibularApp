//
//  ValidationTests.swift
//  ValidationTests
//
//  Created by Julio Figueiredo on 20/05/20.
//  Copyright © 2020 Julio Figueiredo. All rights reserved.
//

import XCTest
import Validation

class EmailValidatorAdapterTests: XCTestCase {
    func test_invalid_emails() {
        let sut = makeSut()
        XCTAssertFalse(sut.isValid(email: "rr"))
        XCTAssertFalse(sut.isValid(email: "rr@"))
        XCTAssertFalse(sut.isValid(email: "rr@rr"))
        XCTAssertFalse(sut.isValid(email: "rr@rr."))
        XCTAssertFalse(sut.isValid(email: "32323@"))
        XCTAssertFalse(sut.isValid(email: "@rr.com"))
    }
    
    func test_valid_emails() {
        let sut = makeSut()
        XCTAssertTrue(sut.isValid(email: "julio@unip.br"))
        XCTAssertTrue(sut.isValid(email: "juliosfigueiredo@gmail.com"))
        XCTAssertTrue(sut.isValid(email: "liofigueiredo@hotmail.com"))
        XCTAssertTrue(sut.isValid(email: "jfigueiredo@icloud.com"))
        XCTAssertTrue(sut.isValid(email: "julio.figueiredo@orolix.com.br"))
        XCTAssertTrue(sut.isValid(email: "julio.figueiredo@me.com"))
    }
}

extension EmailValidatorAdapterTests {
    func makeSut() -> EmailValidatorAdapter {
        return EmailValidatorAdapter()
    }
}
