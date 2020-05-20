//
//  SignUpViewController.swift
//  App
//
//  Created by Julio Figueiredo on 19/05/20.
//  Copyright © 2020 Julio Figueiredo. All rights reserved.
//

import UIKit
import Presentation

class SignUpViewController: UIViewController {
    @IBOutlet weak var tfCpf: UITextField!
    @IBOutlet weak var tfSenha: UITextField!
    @IBOutlet weak var btEntrar: UIButton!
    @IBOutlet weak var btCadastrar: UIButton!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    @IBOutlet weak var vwLoading: UIView!

    var signUp: ((SignViewModel) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vwLoading.isHidden = false
        configure()
    }
    
    private func configure() {
        btEntrar?.addTarget(self, action: #selector(btEntrarTapped), for: .touchUpInside)
    }
    
    @objc private func btEntrarTapped() {
        signUp?(SignViewModel(cpf: nil, name: nil, dataNascimento: nil, anoConclusaoEnsinoMedio: nil, email: nil, password: nil, passwordConfirmation: nil))
    }
}

extension SignUpViewController: LoadingView {
    func display(viewModel: LoadingViewModel) {
        if viewModel.isLoading {
            vwLoading.isHidden = true
        } else {
            vwLoading.isHidden = false
        }
    }
}

extension SignUpViewController: AlertView {
    func showMessage(viewModel: AlertViewModel) {
        
    }
}
