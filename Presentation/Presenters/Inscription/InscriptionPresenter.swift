//
//  InscriptionPresenter.swift
//  Presentation
//
//  Created by Julio Figueiredo on 06/06/20.
//  Copyright © 2020 Julio Figueiredo. All rights reserved.
//

import Foundation
import Domain

public final class InscriptionPresenter {
    private let alertView: AlertView
    private let addInscription: AddInscription
    private let loadingView: LoadingView
    
    public init(alertView: AlertView, addInscription: AddInscription, loadingView: LoadingView) {
        self.alertView = alertView
        self.addInscription = addInscription
        self.loadingView = loadingView
    }
    
    public func inscription(viewModel: InscriptionRequest) {
        loadingView.display(viewModel: LoadingViewModel(isLoading: true))
        addInscription.add(addInscriptionModel: viewModel.toAddInscriptionModel()) { [weak self] result in
            guard let self = self else { return }
            self.loadingView.display(viewModel: LoadingViewModel(isLoading: false))
            switch result {
            case .failure: self.alertView.showMessage(viewModel: AlertViewModel(title: "Erro", message: "Algo inesperado aconteceu, tente novamente em alguns instantes."))
            case .success: self.alertView.showMessage(viewModel: AlertViewModel(title: "Sucesso", message: "Conta criada com sucesso."))
            }
        }
    }
}

