//
//  UIColor+AppColors.swift
//  WF
//
//  Created by Кирилл Щёлоков on 17.05.2023.
//

import UIKit

extension UIColor {
    static let appOrange = UIColor(named: "Orange")
    static let appOrangeBlink = UIColor(named: "OrangeBlink")
    static let appMidGray = UIColor(named: "MidGray")
    static let appDarkGray = UIColor(named: "DarkGray")
    static let appColor4 = UIColor(named: "4Color")
    static let appColor3 = UIColor(named: "3Color")
    static let appColor2 = UIColor(named: "2Color")
    static let appColor1 = UIColor(named: "1Color")
    static let appProgressBar = UIColor(named: "ProgressBarBackground")
}

extension UILabel {
    
    func colorString(text: String?, coloredText: String?, color: UIColor? = .red) {
        
        let attributedString = NSMutableAttributedString(string: text!)
        let range = (text! as NSString).range(of: coloredText!)
        attributedString.setAttributes([NSAttributedString.Key.foregroundColor: UIColor.appOrange!],range: range)
        self.attributedText = attributedString
    }
}
