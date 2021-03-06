//
//  UILabelFactory.swift
//  OcadoAssignment
//
//  Created by Ahmer Hassan on 28/04/2022.
//

import Foundation
import UIKit


public class UILabelFactory {

    public class func createUILabel<T: UILabel>(with colorType: AppColorType = .black, textStyle: AppTextStyle = .title1, alignment: NSTextAlignment = .left, numberOfLines: Int = 1, lineBreakMode: NSLineBreakMode = .byTruncatingTail, text: String? = nil, alpha: CGFloat = 1.0, adjustFontSize: Bool = false) -> T {
        let label = T()
        label.font = UIFont.appFont(forTextStyle: textStyle)
        label.textColor = UIColor.appColor(ofType: colorType)
        label.textAlignment = alignment
        label.numberOfLines = numberOfLines
        label.lineBreakMode = lineBreakMode
        label.text = text
        label.alpha = alpha
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = adjustFontSize
        return label
    }
}
