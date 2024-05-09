//
//  CustomButtonStyle.swift
//  WF
//
//  Created by Кирилл Щёлоков on 17.05.2023.
//

import Foundation
import UIKit

enum CustomButtonStyle{
    case primary, secondary, question
    
    var backgroundColor : UIColor {
        switch self {
        case .primary:
            return .appOrange!
        case .secondary, .question:
            return .clear
        }
    }
    
    var highlighterBackgroundColor: UIColor {
        switch self{
        case .primary, .question:
            return .appOrangeBlink!
        case .secondary:
            return backgroundColor
        }
    }
    
    var highlighterFontColor: UIColor{
        switch self{
        case .primary, .question:
            return fontColor
        case .secondary:
            return fontColor.withAlphaComponent(0.5)
        }
    }
    
    var fontColor: UIColor {
        switch self{
        case .primary:
            return .white
        case .secondary, .question:
            return .appMidGray!
        }
    }
    
    var fontSize: CGFloat {
        switch self{
        case .primary, .question:
            return 16
        case .secondary:
            return 14
        }
    }
    
}
