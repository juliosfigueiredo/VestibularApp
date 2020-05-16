//
//  UseCasesIntegrationTests.swift
//  UseCasesIntegrationTests
//
//  Created by Julio Figueiredo on 16/05/20.
//  Copyright © 2020 Julio Figueiredo. All rights reserved.
//

import XCTest
import Data
import Infra
import Domain

class AddAccountIntegrationTests: XCTestCase {
    func test_add_account() {
        /*
        let alamofireAdapter = AlamofireAdapter()
        let url = URL(string: "https://www.globo.com")!
        let sut = RemoteAddAccount(url: url, httpClient: alamofireAdapter)
        let addAccountModel = AddAccountModel(cpf: "11111111111", name: "Julio Figueiredo", dataNascimento: "14/03/2004", anoConclusaoEnsinoMedio: 2020, email: "juliosfigueiredo@gmail.com", password: "secret", passwordConfirmation: "secret")
        let exp = expectation(description: "waiting")
        sut.add(addAccountModel: addAccountModel) { (result) in
            switch result {
            case .failure: XCTFail("Expect success got \(result) instead")
            case .success(let account):
                XCTAssertNotNil(account.id)
                XCTAssertEqual(account.cpf, addAccountModel.cpf)
                XCTAssertEqual(account.name, addAccountModel.name)
            }
            exp.fulfill()
        }
        wait(for: [exp], timeout: 5) */
    }
}
