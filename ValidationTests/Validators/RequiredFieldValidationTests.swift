//
//  RequiredFieldValidationTests.swift
//  ValidationTests
//
//  Created by Julio Figueiredo on 22/05/20.
//  Copyright © 2020 Julio Figueiredo. All rights reserved.
//

import XCTest
import Presentation
import Validation

class RequiredFieldValidationTests: XCTestCase {
    func test_validate_should_return_error_if_field_is_not_provided() {
        let sut = makeSut(fieldName: "email", fieldLabel: "Email")
        let errorMessage = sut.validate(data: ["name": "Julio"])
        XCTAssertEqual(errorMessage, "O campo Email é obrigatório.")
    }
    
    func test_validate_should_return_error_with_correct_fieldLabel() {
        let sut = makeSut(fieldName: "age", fieldLabel: "Idade")
        let errorMessage = sut.validate(data: ["name": "Julio"])
        XCTAssertEqual(errorMessage, "O campo Idade é obrigatório.")
    }
    
    func test_validate_should_return_nil_if_field_is_provided() {
        let sut = makeSut(fieldName: "email", fieldLabel: "Email")
        let errorMessage = sut.validate(data: ["email": "julio@unip.br"])
        XCTAssertNil(errorMessage)
    }
    
    func test_validate_should_return_nil_if_no_data_is_provided() {
        let sut = makeSut(fieldName: "email", fieldLabel: "Email")
        let errorMessage = sut.validate(data: nil)
        XCTAssertEqual(errorMessage, "O campo Email é obrigatório.")
    }
}

extension RequiredFieldValidationTests {
    func makeSut(fieldName: String, fieldLabel: String, file: StaticString = #file, line: UInt = #line) -> Validation {
        let sut = RequiredFieldValidation(fieldName: fieldName, fieldLabel: fieldLabel)
        checkMemoryLeak(for: sut, file: file, line: line)
        return sut
    }
}
