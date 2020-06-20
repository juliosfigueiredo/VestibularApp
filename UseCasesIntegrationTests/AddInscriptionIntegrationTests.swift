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

class AddInscriptionIntegrationTests: XCTestCase {
    func test_add_inscription() {
        let alamofireAdapter = AlamofireAdapter()
        let url = URL(string: "http://sistemashomologacao.suafaculdade.com.br/bibliografico/api/inscricao")!
        let sut = RemoteAddInscription(url: url, httpClient: alamofireAdapter)
        let addInscriptionModel = AddInscriptionModel(instituto: "UNIP", cpf: "08058872024", idCampus: 4, idCurso: 55, idTurno: 2, redacao: "Teste redacao")
        let exp = expectation(description: "waiting")
        sut.add(addInscriptionModel: addInscriptionModel) { (result) in
            switch result {
            case .failure: XCTFail("Expect success got \(result) instead")
            case .success(let inscription):
                XCTAssertNotNil(inscription.id)
            }
            exp.fulfill()
        }
        wait(for: [exp], timeout: 60)
    }
}
