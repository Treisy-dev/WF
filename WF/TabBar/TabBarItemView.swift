//
//  TabBarItemView.swift
//  WordsFactory
//
//  Created by Степан Потапов on 18.05.2023.
//

import UIKit

protocol CustomTabBarItemViewDelegate: AnyObject {
    func tabBarItemViewDidTap(_ tabView: CustomTabBarItemView)
}

final class CustomTabBarItemView: UIView {
    var isSelected: Bool = false {
        didSet {
            update()
        }
    }
    
    weak var delegate: CustomTabBarItemViewDelegate?
    
    private let iconImageView = UIImageView()
    private let titleLabel = UILabel()
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with item: TabBarTabItems) {
        iconImageView.image = item.icon.withRenderingMode(.alwaysTemplate)
        titleLabel.text = item.title
    }
    
    private func update() {
        iconImageView.tintColor = isSelected ? TabBarTabItems.selectedColor : TabBarTabItems.unselectedColor
        titleLabel.textColor = isSelected ? TabBarTabItems.selectedColor : TabBarTabItems.unselectedColor
    }
    
    @objc
    private func handleTap() {
        delegate?.tabBarItemViewDidTap(self)
    }
    
    private func setup() {
        setupContainer()
        setupIconImageView()
        setupTitleLabel()
    }
    
    private func setupContainer() {
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    }
    
    private func setupIconImageView() {
        addSubview(iconImageView)
        
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.tintColor = TabBarTabItems.unselectedColor
        
        iconImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.greaterThanOrEqualToSuperview().priority(.high)
            make.centerX.equalToSuperview()
            make.height.equalTo(24)
        }
    }
    
    private func setupTitleLabel() {
        addSubview(titleLabel)
        
        titleLabel.textColor = TabBarTabItems.unselectedColor
        titleLabel.textAlignment = .center
        titleLabel.font = .systemFont(ofSize: 14)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(iconImageView.snp.bottom)
            make.leading.trailing.greaterThanOrEqualToSuperview().priority(.high)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
