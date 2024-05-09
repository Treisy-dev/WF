//
//  CustomTabBarView.swift
//  WordsFactory
//
//  Created by Степан Потапов on 18.05.2023.
//

import UIKit

protocol CustomTabBarViewDelegate: AnyObject {
    func tabBarView(_ view: CustomTabBarView, didSelect index: Int)
}

final class CustomTabBarView: UIView {
    weak var delegate: CustomTabBarViewDelegate?
    
    private let tabItemsStackViewContainer = UIStackView()
    
    private var tabs: [(tab: TabBarTabItems, view: CustomTabBarItemView)] = []
    private var selectedTab: (tab: TabBarTabItems, view: CustomTabBarItemView)?
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with tabs: [TabBarTabItems]) {
        tabItemsStackViewContainer.arrangedSubviews.forEach { $0.removeFromSuperview() }
        self.tabs.removeAll()
        
        tabs.forEach { tab in
          let tabView = CustomTabBarItemView()
          tabView.delegate = self
          tabView.configure(with: tab)
          tabItemsStackViewContainer.addArrangedSubview(tabView)
          self.tabs.append((tab, tabView))
        }
        
        selectedTab = self.tabs.first
        updateSelectionTab(animated: false)
    }
    
    func setTab(with index: Int) {
        guard index < tabs.count else { return }
        selectedTab = tabs[index]
        updateSelectionTab(animated: true)
    }
    
    private func updateSelectionTab(animated: Bool) {
      guard let tab = selectedTab else { return }
      tabs.forEach { (_, view: CustomTabBarItemView) in
        view.isSelected = false
      }
      tab.view.isSelected = true
    }
    
    private func setup() {
        setupContainer()
        setupTabItemsStackViewContainer()
    }
    
    private func setupContainer() {
        backgroundColor = .white
        layer.borderColor = UIColor(red: 0.746, green: 0.731, blue: 0.702, alpha: 1).cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 16
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    private func setupTabItemsStackViewContainer() {
        addSubview(tabItemsStackViewContainer)
        tabItemsStackViewContainer.axis = .horizontal
        tabItemsStackViewContainer.distribution = .fillEqually
        tabItemsStackViewContainer.alignment = .center
        
        tabItemsStackViewContainer.snp.makeConstraints { make in
          make.top.equalToSuperview().offset(12)
          make.leading.trailing.equalToSuperview()
          make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).inset(12)
          make.height.equalTo(42)
        }
    }
}

extension CustomTabBarView: CustomTabBarItemViewDelegate {
    func tabBarItemViewDidTap(_ tabView: CustomTabBarItemView) {
        guard let tab = tabs.firstIndex(where: { $0.view == tabView }) else { return }
        delegate?.tabBarView(self, didSelect: tab)
    }
}
