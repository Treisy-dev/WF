//
//  CustomButton.swift
//  WF
//
//  Created by Кирилл Щёлоков on 17.05.2023.
//

import Foundation
import UIKit

final class CustomButton: UIButton {
    
    private let style: CustomButtonStyle
    
    override var isHighlighted: Bool {
        didSet{
            switch style{
            case .primary, .secondary:
                update()
            case .question:
                selectAnswer()
            }
        }
    }
    
    init(withStyle style: CustomButtonStyle){
        self.style = style
        super.init(frame: .zero)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() {
        backgroundColor = style.backgroundColor
        setTitleColor(style.fontColor, for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: style.fontSize)
        layer.cornerRadius = 16
    }
    
    private func update() {
        UIView.animate(withDuration: 0.3) { [weak self] in
            guard let self = self else {return}
            self.backgroundColor = self.isHighlighted ? self.style.highlighterBackgroundColor : self.style.backgroundColor
            self.setTitleColor(self.isHighlighted ? self.style.highlighterFontColor : self.style.fontColor, for: .normal)
        }
        
        
//        backgroundColor = isHighlighted ? style.highlighterBackgroundColor : style.backgroundColor
//        setTitleColor(isHighlighted ? style.highlighterFontColor : style.fontColor, for: .normal)
    }
    
    private func selectAnswer() {
        self.backgroundColor = self.style.highlighterBackgroundColor
    }
    
    
}
