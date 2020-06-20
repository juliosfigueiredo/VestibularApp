//
//  AddAccountSpy.swift
//  PresentationTests
//
//  Created by Julio Figueiredo on 18/05/20.
//  Copyright © 2020 Julio Figueiredo. All rights reserved.
//

import Foundation
import Domain

class AddInscriptionSpy: AddInscription {
    var addInscriptionModel: AddInscriptionModel?
    var completion: ((AddInscription.Result) -> Void)?
    
    func add(addInscriptionModel: AddInscriptionModel, completion: @escaping (AddInscription.Result) -> Void) {
        self.addInscriptionModel = addInscriptionModel
        self.completion = completion
    }
    
    func completeWithError(_ error: DomainError) {
        completion?(.failure(error))
    }
    
    func completeWithAccount(_ inscription: InscriptionModel) {
        completion?(.success(inscription))
    }
}
