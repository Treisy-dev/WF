//
//  TabBarTabItems.swift
//  WordsFactory
//
//  Created by Степан Потапов on 18.05.2023.
//

import UIKit

enum TabBarTabItems: CaseIterable {
    case dictionary
    case training
    case video
    
    var icon: UIImage {
        switch self {
        case .dictionary:
            return UIImage(named: "DictionaryImage")!
        case .training:
            return UIImage(named: "TrainingImage")!
        case .video:
            return UIImage(named: "VideoImage")!
        }
    }
    
    var title: String {
        switch self {
        case .dictionary:
            return "Dictionary"
        case .training:
            return "Training"
        case .video:
            return "Video"
        }
        
    }
    
    static let selectedColor: UIColor = .appOrange!
    static let unselectedColor: UIColor = .appMidGray!
    
}
