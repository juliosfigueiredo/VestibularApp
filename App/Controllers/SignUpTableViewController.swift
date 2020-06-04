//
//  SignUpTableViewController.swift
//  App
//
//  Created by Julio Figueiredo on 29/05/20.
//  Copyright © 2020 Julio Figueiredo. All rights reserved.
//

import UIKit
import Presentation

class SignUpTableViewController: UITableViewController {
    @IBOutlet weak var tfCpf: UITextField!
    @IBOutlet weak var tfNome: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfDDD: UITextField!
    @IBOutlet weak var tfTelefone: UITextField!
    @IBOutlet weak var tfDataNascimento: UITextField!
    @IBOutlet weak var tfAnoConclusao: UITextField!
    @IBOutlet weak var tfSenha: UITextField!
    @IBOutlet weak var tfConfirmarSenha: UITextField!
    @IBOutlet weak var btCadastrar: UIButton!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    @IBOutlet weak var btClose: UIButton!
    

    var signUp: ((SignUpRequest) -> Void)?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        btCadastrar.layer.cornerRadius = 5
        btCadastrar?.addTarget(self, action: #selector(btCadastrarTapped), for: .touchUpInside)
        btClose?.addTarget(self, action: #selector(btCloseTapped), for: .touchUpInside)
        hideKeyboardOnTap()
    }
    
    @objc private func btCadastrarTapped() {
        guard let anoConclusao = tfAnoConclusao.text else {return}
        let viewModel = SignUpRequest(cpf: tfCpf.text, name: tfNome.text, dataNascimento: tfDataNascimento.text, anoConclusaoEnsinoMedio: Int64(anoConclusao), email: tfEmail.text, password: tfSenha.text, passwordConfirmation: tfConfirmarSenha.text)
        
        signUp?(viewModel)
    }
    
    @objc private func btCloseTapped() {
        dismiss(animated: true, completion: nil)
    }
    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
    }
}

extension SignUpTableViewController: LoadingView  {
    public func display(viewModel: LoadingViewModel) {
        if viewModel.isLoading {
            view.isUserInteractionEnabled = false
            loading.isHidden = true
        } else {
            view.isUserInteractionEnabled = true
            loading.isHidden = false
        }
    }
}

extension SignUpTableViewController: AlertView {
    public func showMessage(viewModel: AlertViewModel) {
        let alert = UIAlertController(title: viewModel.title, message: viewModel.message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alert, animated: true)
    }
}
