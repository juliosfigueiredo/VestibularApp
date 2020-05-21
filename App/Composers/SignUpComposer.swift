//
//  SignUpComposer.swift
//  App
//
//  Created by Julio Figueiredo on 21/05/20.
//  Copyright © 2020 Julio Figueiredo. All rights reserved.
//

import Foundation
import Presentation
import Validation
import Domain

public final class SignUpComposer {
    public static func composeControllerWith(addAccount: AddAccount) -> SignUpViewController {
        let controller = SignUpViewController.instantiate()
        let emailValidatorAdapter = EmailValidatorAdapter()
        let presenter = SignPresenter(alertView: WeakVarProxy(controller), emailValidator: emailValidatorAdapter, addAccount: addAccount, loadingView: WeakVarProxy(controller))
        controller.signUp = presenter.signUp
        return controller
    }
}
