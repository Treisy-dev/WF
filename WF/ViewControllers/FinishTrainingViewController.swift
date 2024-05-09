//
//  FinishTrainingViewController.swift
//  WF
//
//  Created by Кирилл Щёлоков on 17.05.2023.
//

import UIKit
import SnapKit

class FinishTrainingViewController: UIViewController {
    
    let containerStackView = UIStackView()
    
    let scoreLable = UILabel()
    let finishLable = UILabel()
    
    let backButton = CustomBackButton()
    
    private var corectAnswers : Int = 0
    private var questionCount : Int = 0
    
    
    var finishImageView = UIImageView()
    let finishImage = UIImage(named: "FinalImage")
    
    let againButton = CustomButton(withStyle: .primary)
    
    init(corectAnswer : Int?, questionCount : Int?) {
        super.init(nibName: nil, bundle: nil)
        self.corectAnswers = corectAnswer!
        self.questionCount = questionCount!
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUp()
        navigationController?.isNavigationBarHidden = true
    }
    
    private func setUp() {
        setUpContainerStackView()
        setUpFinishImageView()
        setUpFinishLable()
        setUpScoreLable()
        setUpAgainButton()
        setUpBackButton()
        
    }
    
    private func setUpBackButton(){
        view.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(15)
            make.top.equalToSuperview().offset(44)
            make.height.width.equalTo(48)
        }
        backButton.addTarget(self, action: #selector(againButtonAction), for: .touchUpInside)
    }
    
    
    private func setUpContainerStackView() {
        view.addSubview(containerStackView)
        
        containerStackView.axis = .vertical
        
        containerStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(179)
            make.trailing.equalToSuperview().inset(33)
            make.leading.equalToSuperview().offset(33)
            make.bottom.equalToSuperview().inset(178)
            make.centerX.equalToSuperview()
        }
    }
    
    private func setUpFinishLable() {
        containerStackView.addArrangedSubview(finishLable)
        finishLable.text = "Training is finished"
        finishLable.font = .appRubic?.withSize(24)
        finishLable.textColor = .appDarkGray
        finishLable.textAlignment = .center
        containerStackView.setCustomSpacing(32, after: finishImageView)
    }
    
    private func setUpScoreLable() {
        containerStackView.addArrangedSubview(scoreLable)
        scoreLable.numberOfLines = 2
        scoreLable.text = "Correct: \(corectAnswers)\nIncorrent: \(questionCount - corectAnswers)"
        scoreLable.font = .appRubic?.withSize(14)
        scoreLable.textColor = .appMidGray
        scoreLable.textAlignment = .center
        containerStackView.setCustomSpacing(8, after: finishLable)
        
    }
    
    private func setUpFinishImageView(){
        finishImageView = UIImageView(frame: containerStackView.bounds)
        finishImageView.image = finishImage
        finishImageView.center = view.center
        finishImageView.contentMode = .scaleAspectFill
        containerStackView.addArrangedSubview(finishImageView)
        
    }
    
    private func setUpAgainButton() {
        containerStackView.addArrangedSubview(againButton)
        againButton.setTitle("Again", for: .normal)
        containerStackView.setCustomSpacing(32, after: scoreLable)
        againButton.snp.makeConstraints { make in
            make.height.equalTo(56)
        }
        againButton.addTarget(self, action: #selector(againButtonAction), for: .touchUpInside)
    }
    
    
    @objc
    private func againButtonAction(){
        navigationController?.popToRootViewController(animated: true)
        
        
    }
}
