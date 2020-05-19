//
//  AddAccountViewController.swift
//  App
//
//  Created by Julio Figueiredo on 19/05/20.
//  Copyright © 2020 Julio Figueiredo. All rights reserved.
//

import UIKit

class AddAccountViewController: UIViewController {
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
}
