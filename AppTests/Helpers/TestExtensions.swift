//
//  TestExtensions.swift
//  AppTests
//
//  Created by Julio Figueiredo on 20/05/20.
//  Copyright © 2020 Julio Figueiredo. All rights reserved.
//

import Foundation
import UIKit

extension UIControl {
    func simulate(event: UIControl.Event) {
        allTargets.forEach { (target) in
            actions(forTarget: target, forControlEvent: event)?.forEach({ (action) in
                (target as NSObject).perform(Selector(action))
            })
        }
    }
    
    func simulateTap() {
        simulate(event: .touchUpInside)
    }
}
