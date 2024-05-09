//
//  BackButton.swift
//  WF
//
//  Created by Кирилл Щёлоков on 19.05.2023.
//

import UIKit

class CustomBackButton: UIButton {
    
    let backImage = UIImage(named: "backIcon")
    
    init(){
        super.init(frame: .zero)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() {
        self.layer.borderColor = UIColor.appMidGray?.cgColor
        self.layer.borderWidth = 1
        self.backgroundColor = .white
        self.layer.cornerRadius = 25
                    
        self.contentMode = .center
        self.setImage(backImage, for: .normal)
    }

}
