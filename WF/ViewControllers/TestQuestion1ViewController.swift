//
//  TestQuestionViewController.swift
//  WF
//
//  Created by Кирилл Щёлоков on 17.05.2023.
//

import UIKit
import SnapKit

class TestQuestion1ViewController: UIViewController {
    
    let questionNumberLabel = UILabel()
    let questionLabel = UILabel()
    
    let backButton = CustomBackButton()
        
    var questionNumber = 1
    var questionCount = 2
    
    var timer = Timer()
    var timernumber = 0
    
    var corectAnswers = 0
    
    let answer1 = CustomButton(withStyle: .question)
    let answer2 = CustomButton(withStyle: .question)
    let answer3 = CustomButton(withStyle: .question)

    
    let progressBar = UIProgressView(progressViewStyle: .bar)
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUp()
        navigationController?.isNavigationBarHidden = true
    }
    
    private func setUp(){
        setUpQuestionNumberLabel()
        setUpQuestionLabel()
        setUpAnwerButtons()
        setUpProgressView()
        setUpBackButton()
    }
    
    private func setUpQuestionNumberLabel() {

        view.addSubview(questionNumberLabel)

        questionNumberLabel.text = "\(questionNumber) of \(questionCount)"
        questionNumberLabel.font = .appRubic?.withSize(16)
        questionNumberLabel.textColor = .appMidGray
        questionNumberLabel.textAlignment = .center
        questionNumberLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(116)
            make.trailing.equalToSuperview().inset(16)
            make.leading.equalToSuperview().inset(16)
        }
    }
    
    private func setUpBackButton(){
        view.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(15)
            make.top.equalToSuperview().offset(44)
            make.height.width.equalTo(48)
        }
        backButton.addTarget(self, action: #selector(tap), for: .touchUpInside)
    }
    
    private func setUpQuestionLabel() {
        
        view.addSubview(questionLabel)
        
        questionLabel.text = "The practice or skill of\n preparing food by combining,\n mixing, and heating\n ingredients."
        questionLabel.numberOfLines = 4
        questionLabel.font = .appRubic?.withSize(50)
        questionLabel.textColor = .appDarkGray
        questionLabel.textAlignment = .center
        questionLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(150)
            make.trailing.equalToSuperview().inset(16)
            make.leading.equalToSuperview().inset(16)
        }
        
    }
    
    private func setUpProgressView() {
        view.addSubview(progressBar)
        progressBar.setProgress(0, animated: true)
        progressBar.trackTintColor = .appProgressBar
        progressBar.progressTintColor = .appOrange
        progressBar.layer.cornerRadius = 3
        progressBar.clipsToBounds = true
        progressBar.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(51)
            make.trailing.equalToSuperview().inset(16)
            make.leading.equalToSuperview().inset(16)
            make.height.equalTo(5)
        }
    }
    
    private func setUpAnwerButtons(){
        view.addSubview(answer1)
        view.addSubview(answer2)
        view.addSubview(answer3)
        
        let createButton = { (button : CustomButton, label : String, distanceFromTop: Int) in
            
            button.setTitle(label, for: .normal)
            button.contentHorizontalAlignment = .left
            button.layer.borderWidth = 0.5
            button.layer.borderColor = UIColor.appMidGray?.cgColor
            button.addTarget(self, action: #selector(self.selectAnswer), for: .touchUpInside)
            button.snp.makeConstraints { make in
                make.top.equalToSuperview().offset(distanceFromTop)
                make.trailing.equalToSuperview().inset(16)
                make.leading.equalToSuperview().inset(16)
                make.height.equalTo(58)
            }
        }
        
        createButton(answer1, "\tA.\t" + "Cooking", 302)
        createButton(answer2, "\tB.\t" + "Smiling", 376)
        createButton(answer3, "\tC.\t" + "Freezing", 450)
    }

    
    @objc
    private func selectAnswer() {
        if (answer1.backgroundColor == .appOrangeBlink || answer2.backgroundColor == .appOrangeBlink || answer3.backgroundColor == .appOrangeBlink){
            timernumber = 0
            answer1.backgroundColor = .clear
            answer2.backgroundColor = .clear
            answer3.backgroundColor = .clear
        }
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        
        progressBar.progress = Float(questionNumber)/Float(questionCount)
    }
    
    @objc
    private func timerAction(){
        timernumber -= 1
        if timernumber == -3{
            timer.invalidate()
            if answer1.backgroundColor == .appOrangeBlink {
                corectAnswers += 1
            }
            let vc = TestQuestion2ViewController(corectAnswer: corectAnswers, questionCount: questionCount)
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @objc
    private func tap(){
        navigationController?.popToRootViewController(animated: true)
    }
}
