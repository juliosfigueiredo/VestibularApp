//
//  RemoteAddAccount.swift
//  Data
//
//  Created by Julio Figueiredo on 04/06/20.
//  Copyright © 2020 Julio Figueiredo. All rights reserved.
//

import Foundation
import Domain

public final class RemoteAddInscription: AddInscription {
    private let url: URL
    private let httpClient: HttpPostClient
    
    public init(url: URL, httpClient: HttpPostClient) {
        self.url = url
        self.httpClient = httpClient
    }
    
    public func add(addInscriptionModel: AddInscriptionModel, completion: @escaping (AddInscription.Result) -> Void) {
        httpClient.post(to: url, with: addInscriptionModel.toData()) { [weak self] result in
            guard self != nil else { return }
            switch result {
            case .success(let data):
                if let model: InscriptionModel = data?.toModel() {
                    completion(.success(model))
                } else {
                    completion(.failure(.unexpected))
                }
            case .failure: completion(.failure(.unexpected))
                
            }
        }
    }
}
