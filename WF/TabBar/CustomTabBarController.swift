//
//  CustomTabBarController.swift
//  WordsFactory
//

import UIKit

final class CustomTabBarController: UITabBarController {
    private let tabBarView = CustomTabBarView()
    
    override var selectedIndex: Int {
        didSet {
            tabBarView.setTab(with: selectedIndex)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        setupContainer()
        setupTabBar()
    }
    
    private func setupContainer() {
        self.tabBar.isHidden = true
    }
    
    private func setupTabBar() {
        view.addSubview(tabBarView)
        
        tabBarView.delegate = self
        tabBarView.configure(with: TabBarTabItems.allCases)
        
        tabBarView.snp.makeConstraints { make in
          make.leading.trailing.equalToSuperview()
          make.bottom.equalToSuperview()
        }
    }
}

extension CustomTabBarController: CustomTabBarViewDelegate {
    func tabBarView(_ view: CustomTabBarView, didSelect index: Int) {
        selectedIndex = index
    }
}
