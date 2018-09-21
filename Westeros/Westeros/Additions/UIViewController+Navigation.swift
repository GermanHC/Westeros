//
//  UIViewController+Navigation.swift
//  Westeros
//
//  Created by German Hernandez on 20/9/18.
//  Copyright © 2018 German Hernandez. All rights reserved.
//

import UIKit

extension UIViewController{
    func wrappedInNavigation() -> UINavigationController {
        return UINavigationController(rootViewController: self)
    }
}
