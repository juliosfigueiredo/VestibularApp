//
//  DataTests.swift
//  DataTests
//
//  Created by Julio Figueiredo on 15/05/20.
//  Copyright © 2020 Julio Figueiredo. All rights reserved.
//

import XCTest
import Domain
import Data

class RemoteAddAccountTests: XCTestCase {

    func test_add_should_call_httpClient_with_correct_url() {
        let url = URL(string: "http://any-url.com")!
        let (sut, httpClientSpy) = makeSut(url: url)
        sut.add(addAccountModel: makeAddAccountModel())
        XCTAssertEqual(httpClientSpy.urls, [url])
    }
    
    func test_add_should_call_httpClient_with_correct_data() {
        let (sut, httpClientSpy) = makeSut()
        let addAccountModel = makeAddAccountModel()
        sut.add(addAccountModel: addAccountModel)
        XCTAssertEqual(httpClientSpy.data, addAccountModel.toData())
    }
}

extension RemoteAddAccountTests {
    
    func makeSut(url: URL = URL(string: "http://any-url.com")!) -> (sut: RemoteAddAccount, httpClientSpy: HttpClientSpy) {
        let httpClientSpy = HttpClientSpy()
        let sut = RemoteAddAccount(url: url, httpClient: httpClientSpy)
        return (sut, httpClientSpy)
    }
    
    func makeAddAccountModel() -> AddAccountModel {
        return AddAccountModel(cpf: "any_cpf", name: "any_name", dataNascimento: "any_nascimento", anoConclusaoEnsinoMedio: 2020, email: "any_email@mail.com", password: "any_senha", passwordConfirmation: "any_senha")
    }
    
    class HttpClientSpy: HttpPostClient {
        var urls = [URL]()
        var data: Data?
        
        func post(to url: URL, with data: Data?) {
            self.urls.append(url)
            self.data = data
        }
    }
}
