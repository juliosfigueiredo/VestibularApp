//
//  RemoteAddAccount.swift
//  Data
//
//  Created by Julio Figueiredo on 15/05/20.
//  Copyright © 2020 Julio Figueiredo. All rights reserved.
//

import Foundation
import Domain

public final class RemoteAddAccount: AddAccount {
    private let url: URL
    private let httpClient: HttpPostClient
    
    public init(url: URL, httpClient: HttpPostClient) {
        self.url = url
        self.httpClient = httpClient
    }
    
    public func add(addAccountModel: AddAccountModel, completion: @escaping (AddAccount.Result) -> Void) {
        httpClient.post(to: url, with: addAccountModel.toData()) { [weak self] result in
            guard self != nil else { return }
            switch result {
            case .success(let data):
                if let model: AccountModel = data?.toModel() {
                    completion(.success(model))
                } else {
                    completion(.failure(.unexpected))
                }
            case .failure(let error):
                switch error {
                case .forbidden:
                    completion(.failure(.cpfInUse))
                default:
                    completion(.failure(.unexpected))
                }
            }
        }
    }
}
