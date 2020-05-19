//
//  SignUpViewController.swift
//  App
//
//  Created by Julio Figueiredo on 19/05/20.
//  Copyright © 2020 Julio Figueiredo. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    @IBOutlet weak var tfCpf: UITextField!
    @IBOutlet weak var tfSenha: UITextField!
    @IBOutlet weak var btEntrar: UIButton!
    @IBOutlet weak var btCadastrar: UIButton!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    @IBOutlet weak var vwLoading: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func signUp(_ sender: Any) {
        
    }
}
