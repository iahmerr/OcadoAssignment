//
//  UINavigationControllerFactory.swift
//  OcadoAssignment
//
//  Created by Ahmer Hassan on 01/05/2022.
//

import Foundation
import UIKit

public class UINavigationControllerFactory {
    
    public class func createTransparentNavigationBarNavigationController(rootViewController: UIViewController, barStyle: UIBarStyle? = .default ) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.navigationBar.tintColor = .black
        nav.navigationBar.setBackgroundImage(UIImage(), for: .default)
        nav.navigationBar.shadowImage = UIImage()
        nav.navigationBar.isTranslucent = true
        nav.navigationBar.isHidden = false
        nav.modalPresentationStyle = .fullScreen
        nav.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.regular, NSAttributedString.Key.foregroundColor: UIColor.black]
        nav.navigationBar.barStyle = barStyle ?? .default
        return nav
    }
}
