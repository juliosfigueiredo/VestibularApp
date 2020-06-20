//
//  InscriptionPresenterTests.swift
//  PresentationTests
//
//  Created by Julio Figueiredo on 06/06/20.
//  Copyright © 2020 Julio Figueiredo. All rights reserved.
//

import XCTest
import Presentation
import Domain

class InscriptionPresenterTests: XCTestCase {
    func test_inscrption_should_call_addInscription_with_correct_values() {
        let addInscriptionSpy = AddInscriptionSpy()
        let sut = makeSut(addInscription: addInscriptionSpy)
        sut.inscription(viewModel: makeInscriptionViewModel())
        XCTAssertEqual(addInscriptionSpy.addInscriptionModel, makeAddInscriptionModel())
    }
    
    func test_inscription_should_show_generic_error_message_if_addInscription_fails() {
        let alertViewSpy = AlertViewSpy()
        let addInscriptionSpy = AddInscriptionSpy()
        let sut = makeSut(alertView: alertViewSpy, addInscription: addInscriptionSpy)
        let exp = expectation(description: "waiting")
        let inscriptionViewModel = makeInscriptionViewModel()
        alertViewSpy.observe { (viewModel) in
            XCTAssertEqual(viewModel, AlertViewModel(title: "Erro", message: "Algo inesperado aconteceu, tente novamente em alguns instantes."))
            exp.fulfill()
        }
        sut.inscription(viewModel: inscriptionViewModel)
        addInscriptionSpy.completeWithError(.unexpected)
        wait(for: [exp], timeout: 1)
    }
    
    func test_inscription_should_show_success_message_if_addInscription_succeeds() {
        let alertViewSpy = AlertViewSpy()
        let addInscriptionSpy = AddInscriptionSpy()
        let sut = makeSut(alertView: alertViewSpy, addInscription: addInscriptionSpy)
        let exp = expectation(description: "waiting")
        let inscriptionViewModel = makeInscriptionViewModel()
        alertViewSpy.observe { (viewModel) in
            XCTAssertEqual(viewModel, AlertViewModel(title: "Sucesso", message: "Conta criada com sucesso."))
            exp.fulfill()
        }
        sut.inscription(viewModel: inscriptionViewModel)
        addInscriptionSpy.completeWithAccount(makeInscriptionModel())
        wait(for: [exp], timeout: 1)
    }
    
    func test_inscription_should_show_loading_before_and_after_addInscription() {
        let loadingViewSpy = LoadingViewSpy()
        let addInscriptionSpy = AddInscriptionSpy()
        let sut = makeSut(addInscription: addInscriptionSpy, loadingView: loadingViewSpy)
        let exp = expectation(description: "waiting")
        loadingViewSpy.observe { (viewModel) in
            XCTAssertEqual(viewModel, LoadingViewModel(isLoading: true))
            exp.fulfill()
        }
        sut.inscription(viewModel: makeInscriptionViewModel())
        wait(for: [exp], timeout: 1)
        let exp2 = expectation(description: "waiting")
        loadingViewSpy.observe { (viewModel) in
            XCTAssertEqual(viewModel, LoadingViewModel(isLoading: false))
            exp2.fulfill()
        }
        addInscriptionSpy.completeWithError(.unexpected)
        wait(for: [exp2], timeout: 1)
    }
}

extension InscriptionPresenterTests {
    func makeSut(alertView: AlertViewSpy = AlertViewSpy(), addInscription: AddInscriptionSpy = AddInscriptionSpy(), loadingView: LoadingViewSpy = LoadingViewSpy(), file: StaticString = #file, line: UInt = #line) -> InscriptionPresenter {
        let sut = InscriptionPresenter(alertView: alertView, addInscription: addInscription, loadingView: loadingView)
        checkMemoryLeak(for: sut, file: file, line: line)
        return sut
    }
}
