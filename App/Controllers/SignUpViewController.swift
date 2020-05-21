//
//  SignUpViewController.swift
//  App
//
//  Created by Julio Figueiredo on 19/05/20.
//  Copyright © 2020 Julio Figueiredo. All rights reserved.
//

import UIKit
import Presentation

public class SignUpViewController: UIViewController, Storyboarded {
    @IBOutlet weak var tfCpf: UITextField!
    @IBOutlet weak var tfNome: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfDataNascimento: UITextField!
    @IBOutlet weak var tfAnoConclusao: UITextField!
    @IBOutlet weak var tfSenha: UITextField!
    @IBOutlet weak var tfConfirmarSenha: UITextField!
    @IBOutlet weak var btCadastrar: UIButton!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    @IBOutlet weak var vwLoading: UIView!

    var signUp: ((SignViewModel) -> Void)?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        btCadastrar.layer.cornerRadius = 5
        btCadastrar?.addTarget(self, action: #selector(btEntrarTapped), for: .touchUpInside)
        hideKeyboardOnTap()
    }
    
    
    
    @objc private func btEntrarTapped() {
        guard let anoConclusao = tfAnoConclusao.text else {return}
        let viewModel = SignViewModel(cpf: tfCpf.text, name: tfNome.text, dataNascimento: tfDataNascimento.text, anoConclusaoEnsinoMedio: Int64(anoConclusao), email: tfEmail.text, password: tfSenha.text, passwordConfirmation: tfConfirmarSenha.text)
        
        signUp?(viewModel)
    }
}

extension SignUpViewController: LoadingView {
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

extension SignUpViewController: AlertView {
    public func showMessage(viewModel: AlertViewModel) {
        let alert = UIAlertController(title: viewModel.title, message: viewModel.message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alert, animated: true)
    }
}
