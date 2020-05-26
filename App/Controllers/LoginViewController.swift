//
//  LoginViewController.swift
//  App
//
//  Created by Julio Figueiredo on 20/05/20.
//  Copyright © 2020 Julio Figueiredo. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, Storyboarded {
    @IBOutlet weak var loading: UIActivityIndicatorView!
    @IBOutlet weak var vwLoading: UIView!
    @IBOutlet weak var tfCpf: UITextField!
    @IBOutlet weak var tfSenha: UITextField!
    @IBOutlet weak var btEntrar: UIButton!
    @IBOutlet weak var btCadastrar: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        
    }
    
    private func configure() {
        btEntrar.layer.cornerRadius = 5
        btCadastrar.layer.cornerRadius = 5
        hideKeyboardOnTap()
    }
}
