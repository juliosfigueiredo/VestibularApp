//
//  AlertViewSpy.swift
//  PresentationTests
//
//  Created by Julio Figueiredo on 18/05/20.
//  Copyright © 2020 Julio Figueiredo. All rights reserved.
//

import Foundation
import Presentation

class AlertViewSpy: AlertView {
    var viewModel: AlertViewModel?
    var emit: ((AlertViewModel) -> Void)?
    
    func observe(completion: @escaping (AlertViewModel) -> Void) {
        self.emit = completion
    }
    
    func showMessage(viewModel: AlertViewModel) {
        self.emit?(viewModel)
    }
}
