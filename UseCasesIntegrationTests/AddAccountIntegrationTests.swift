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
        let alamofireAdapter = AlamofireAdapter()
        let url = URL(string: "http://sistemashomologacao.suafaculdade.com.br/sistemas_siap/controleprovav2/api/candidato/cadastrar")!
        let sut = RemoteAddAccount(url: url, httpClient: alamofireAdapter)
        let addAccountModel = AddAccountModel(cpf: "68503228009", name: "JULIO FIGUEIREDO", dataNascimento: "14/03/2004", anoConclusaoEnsinoMedio: 2020, email: "juliosfigueiredo@gmail.com", password: "secret", passwordConfirmation: "secret")
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
        wait(for: [exp], timeout: 60)
        let exp2 = expectation(description: "waiting")
        sut.add(addAccountModel: addAccountModel) { (result) in
            switch result {
            case .failure(let error) where error == .cpfInUse:
                XCTAssertNotNil(error)
            default:
                XCTFail("Expect success got \(result) instead")
            }
            exp2.fulfill()
        }
        wait(for: [exp2], timeout: 60)
    }
}
