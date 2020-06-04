//
//  Storyboarded.swift
//  App
//
//  Created by Julio Figueiredo on 20/05/20.
//  Copyright © 2020 Julio Figueiredo. All rights reserved.
//

import Foundation
import UIKit

public protocol Storyboarded {
    static func instantiate(fullScreen: Bool) -> Self
}

extension Storyboarded where Self: UIViewController {
    public static func instantiate(fullScreen: Bool) -> Self {
        let viewController = String(describing: self)
        let bundle = Bundle(for: Self.self)
        let storyBoard = UIStoryboard(name: "Main", bundle: bundle)
        let controller = storyBoard.instantiateViewController(identifier: viewController) as! Self
        if fullScreen {
            controller.modalPresentationStyle = .fullScreen
        }
        return controller
    }
}
