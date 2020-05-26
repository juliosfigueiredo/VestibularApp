//
//  LoginViewController.swift
//  App
//
//  Created by Julio Figueiredo on 20/05/20.
//  Copyright © 2020 Julio Figueiredo. All rights reserved.
//

import UIKit
import Presentation

public class LoginViewController: UIViewController, Storyboarded {
    @IBOutlet weak var loading: UIActivityIndicatorView!
    @IBOutlet weak var vwLoading: UIView!
    @IBOutlet weak var tfCpf: UITextField!
    @IBOutlet weak var tfSenha: UITextField!
    @IBOutlet weak var btEntrar: UIButton!
    @IBOutlet weak var btCadastrar: UIButton!
    
    var login: ((LoginRequest) -> Void)?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        
    }
    
    private func configure() {
        btEntrar.layer.cornerRadius = 5
        btCadastrar.layer.cornerRadius = 5
        btEntrar?.addTarget(self, action: #selector(btEntrarTapped), for: .touchUpInside)
        hideKeyboardOnTap()
    }
    
    @objc private func btEntrarTapped() {
        let viewModel = LoginRequest(cpf: tfCpf.text, password: tfSenha.text)
        login?(viewModel)
    }
}

extension LoginViewController: LoadingView {
    public func display(viewModel: LoadingViewModel) {
        if viewModel.isLoading {
            view.isUserInteractionEnabled = false
            vwLoading.isHidden = true
        } else {
            view.isUserInteractionEnabled = true
            vwLoading.isHidden = false
        }
    }
}

extension LoginViewController: AlertView {
    public func showMessage(viewModel: AlertViewModel) {
        let alert = UIAlertController(title: viewModel.title, message: viewModel.message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alert, animated: true)
    }
}
