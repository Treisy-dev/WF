//
//  DictionaryViewController.swift
//  WF
//
//  Created by Кирилл Щёлоков on 19.05.2023.
//

import UIKit

class DictionaryViewController: UIViewController {
    
    let findTextField = UITextField()
    
    let findButton = UIButton()
    let sayButton = UIButton()
    let addDictionaryButton = CustomButton(withStyle: .primary)
    
    var word : [WordInformation] = []
    
    let sayImage = UIImage(named: "SayImage")
    let findImage = UIImage(named: "FindImage")
    
    let wordStackView = UIStackView()
    
    let headWordLabel = UILabel()
    let headPartOfSpechLabel = UILabel()
    let headMeaningsLabel = UILabel()
    let transcriptionLabel = UILabel()
    let partOfSpeechLabel = UILabel()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUp()
    }
    
    private func setUp(){
        setUpStackView()
        setUpFindTextField()
        setUpFindButton()
        setUpHeadWordLabel()
        setUpTranscriptionLabel()
        setUpSayButton()
        setUpPartOfSpeechLabel()
        setUpHeadPartOfSpeech()
        setUpHeadMeaningsLabel()
        setUpAddDictionaryButton()
    }
    
    private func setUpStackView() {
        view.addSubview(wordStackView)
        
        wordStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(132)
            make.trailing.equalToSuperview().inset(16)
            make.leading.equalToSuperview().offset(16)
        }
        
        wordStackView.axis = .horizontal
        wordStackView.alignment = .leading
        wordStackView.distribution = .fill
        wordStackView.spacing = 16
    }
    
    private func setUpHeadWordLabel(){
        wordStackView.addArrangedSubview(headWordLabel)
        headWordLabel.textColor = .appDarkGray
        headWordLabel.text = "123123"
        headWordLabel.font = .appRubic
        
    }
    
    private func setUpTranscriptionLabel(){
        wordStackView.addArrangedSubview(transcriptionLabel)
        transcriptionLabel.textColor = .appOrange
        transcriptionLabel.text = "123123"
        transcriptionLabel.font = .appRubic?.withSize(14)
        
    }
    
    private func setUpSayButton(){
        wordStackView.addArrangedSubview(sayButton)
        sayButton.setImage(sayImage, for: .normal)
        
        let spacer = UIView()
        spacer.isUserInteractionEnabled = false
        spacer.backgroundColor = .clear
        spacer.setContentHuggingPriority(.fittingSizeLevel, for: .horizontal)
        spacer.setContentCompressionResistancePriority(.fittingSizeLevel, for: .horizontal)
        
        wordStackView.addArrangedSubview(spacer)
    }
    
    private func setUpFindTextField(){
        view.addSubview(findTextField)
        findTextField.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(60)
            make.trailing.equalToSuperview().inset(16)
            make.leading.equalToSuperview().offset(16)
            make.height.equalTo(56)
        }
        
        findTextField.placeholder = "Type something"
        findTextField.text = "apple"
        findTextField.layer.borderWidth = 1
        findTextField.layer.borderColor = UIColor.appMidGray?.cgColor
        findTextField.layer.cornerRadius = 10
        findTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: findTextField.frame.height))
        findTextField.leftViewMode = .always
    }
    
    private func setUpFindButton(){
        view.addSubview(findButton)
        
        findButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(180)
            make.trailing.equalToSuperview().inset(18)
            //make.bottom.equalToSuperview().inset(18)
            make.leading.equalToSuperview().offset(305)
        }
        
        findButton.setImage(findImage, for: .normal)
        findButton.addTarget(self, action: #selector(findAction), for: .touchUpInside)
    }
    
    private func setUpHeadPartOfSpeech(){
        view.addSubview(headPartOfSpechLabel)
        
        headPartOfSpechLabel.textColor = .appDarkGray
        headPartOfSpechLabel.text = "Part of speech:"
        headPartOfSpechLabel.font = .appRubic
        
        headPartOfSpechLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(180)
            make.leading.equalToSuperview().offset(16)
            make.height.equalTo(26)
        }
        
    }
    
    private func setUpPartOfSpeechLabel(){
        view.addSubview(partOfSpeechLabel)
        
        partOfSpeechLabel.textColor = .appMidGray
        partOfSpeechLabel.text = "123123"
        partOfSpeechLabel.font = .appRubic
        
        partOfSpeechLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(185)
            make.leading.equalToSuperview().offset(173)
            make.trailing.equalToSuperview().inset(167)
            make.height.equalTo(21)
        }
    }
    
    private func setUpHeadMeaningsLabel(){
        view.addSubview(headMeaningsLabel)
        
        headMeaningsLabel.textColor = .appDarkGray
        headMeaningsLabel.text = "Meanings:"
        headMeaningsLabel.font = .appRubic
        
        headMeaningsLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(222)
            make.leading.equalToSuperview().offset(16)
            make.height.equalTo(26)
        }
    }
    
    private func setUpAddDictionaryButton(){
        view.addSubview(addDictionaryButton)
        addDictionaryButton.setTitle("Add to Dictionary", for: .normal)
        addDictionaryButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(642)
            make.leading.equalToSuperview().offset(33)
            make.trailing.equalToSuperview().inset(33)
            make.height.equalTo(56)
        }
    }
    
    private func getWord(word : String){
        let nc = NetworkService.shared
        nc.getWordInfo(for: word) { result in
            switch result {
            case .success(let word):
                self.word = word
            case .failure(let error):
                print("HELP MEEEEE")
            }
        }
    }
    
    private func update(){
        setUpHeadWordLabel()
        setUpTranscriptionLabel()
        
    }
    
    @objc
    private func findAction(){
        getWord(word: findTextField.text!)
        update()
    }

}
