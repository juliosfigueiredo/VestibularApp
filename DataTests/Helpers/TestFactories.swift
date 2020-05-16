//
//  TestFactories.swift
//  DataTests
//
//  Created by Julio Figueiredo on 15/05/20.
//  Copyright © 2020 Julio Figueiredo. All rights reserved.
//

import Foundation

func makeInvalidData() -> Data {
    return Data("invalid_data".utf8)
}

func makeValidData() -> Data {
    return Data("{\"name\":\"Julio\"}".utf8)
}

func makeUrl() -> URL {
    return URL(string: "http://any-url.com")!
}

func makeError() -> Error {
    return NSError(domain: "any_error", code: 0)
}

func makeHttpResponse(statusCode: Int = 200) -> HTTPURLResponse {
    return HTTPURLResponse(url: makeUrl(), statusCode: statusCode, httpVersion: nil, headerFields: nil)!
}
