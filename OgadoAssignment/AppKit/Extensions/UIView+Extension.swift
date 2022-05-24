//
//  UIView+Extension.swift
//  OcadoAssignment
//
//  Created by Ahmer Hassan on 29/04/2022.
//

import Foundation
import UIKit

extension UIView {
    
    func applyShadow() {
        layoutIfNeeded()
        let shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: 10)
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 20
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
        self.layer.shadowOpacity = 0.3
        self.layer.shadowPath = shadowPath.cgPath
    }
    
    func createBorderLine(){
        layer.cornerRadius = 20
        layer.borderColor = UIColor.appColor(ofType: .cellLight).cgColor
        layer.borderWidth = 2.0
    }
}
