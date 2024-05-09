//
//  TrainingViewController.swift
//  WF
//
//  Created by Кирилл Щёлоков on 17.05.2023.
//

import UIKit
import SnapKit

class TrainingViewController: UIViewController {
    
    let countWordsInDictionary = UILabel()
    let mainLabel = UILabel()
    let timerLabel = UILabel()
        
    let colorDic: [Int : UIColor] = [4 : .appColor4!, 3 : .appColor3!, 2 : .appColor2!, 1 : .appColor1!]
    
    let shapeLayer = CAShapeLayer()
    
    let startButton = CustomButton(withStyle: .primary)
    
    var timer = Timer()
    var timerNumber = 5
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.animationCircular()
    }
    
    override func viewWillAppear(_ animated: Bool)  {
        super.viewWillAppear(true)
        timerNumber = 5
        view.backgroundColor = .white
        timerLabel.isHidden = true
        shapeLayer.isHidden = true
        startButton.isHidden = false
        setUp()
        animationCircular()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        timerLabel.isHidden = true
        shapeLayer.isHidden = true
        setUp()
        animationCircular()
    }
    
    
    private func setUp() {
        setUpMainLabel()
        setUpStartButton()
        setUpTimerLabel()
    }
    
    private func setUpMainLabel(){
        
        view.addSubview(mainLabel)
        
        
        mainLabel.textColor = .black
        mainLabel.colorString(text: "There are 25 words\nin your Dictionary.\n\nStart the Training?", coloredText: "25")
        mainLabel.numberOfLines = 4
        mainLabel.textAlignment = .center
        mainLabel.font = .appRubic?.withSize(24)
        
        mainLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(257)
            make.leading.equalToSuperview().offset(4)
            make.trailing.equalToSuperview().inset(4)
            make.bottom.equalToSuperview().inset(492)
        }
    }
    
    private func setUpTimerLabel(){
        view.addSubview(timerLabel)
        timerLabel.font = .appRubic?.withSize(56)
        timerLabel.text = "\(timerNumber)"
        timerLabel.textColor = .appOrange
        timerLabel.textAlignment = .center
        timerLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(519)
            make.trailing.equalToSuperview().inset(175)
            make.leading.equalToSuperview().offset(163)
        }
        
    }
    
    private func setUpStartButton(){
        view.addSubview(startButton)
        startButton.setTitle("Start", for: .normal)
        startButton.addTarget(self, action: #selector(startButtonAction), for: .touchUpInside)
        startButton.snp.makeConstraints { make in
            make.height.equalTo(56)
            make.bottom.equalToSuperview().inset(187)
            make.leading.equalToSuperview().offset(33)
            make.trailing.equalToSuperview().inset(33)
        }
    }
    
    @objc
    private func startButtonAction() {
        startButton.isHidden = true
        timerLabel.isHidden = false
        shapeLayer.isHidden = false
        basicAnimation()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,selector: #selector(timerAction), userInfo: nil, repeats: true)
    
    }
    
    @objc
    private func timerAction(){
        timerNumber -= 1
        timerLabel.text = "\(timerNumber)"
        if timerNumber == 0{
            timerLabel.textColor = .appOrange
            timerLabel.text = "GO!"
            timer.invalidate()
            navigationController?.pushViewController(TestQuestion1ViewController(), animated: true)
        } else {
            timerLabel.textColor = colorDic[timerNumber]
        }
    }
    
    private func animationCircular(){
        let centre = CGPoint(x: timerLabel.center.x, y: timerLabel.center.y)
        let endAngle = (-CGFloat.pi / 2)
        let startAngle = 2 * CGFloat.pi + endAngle
        
        
        let circularPath = UIBezierPath(arcCenter: centre, radius: 50, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        
        shapeLayer.path = circularPath.cgPath
        shapeLayer.lineWidth = 10
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeEnd = 1
        shapeLayer.lineCap = CAShapeLayerLineCap.round
        shapeLayer.strokeColor = UIColor.appOrange?.cgColor
        view.layer.addSublayer(shapeLayer)
    }
    
    private func basicAnimation(){
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        
        basicAnimation.toValue = 0
        basicAnimation.duration = CFTimeInterval(timerNumber)
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = true
        shapeLayer.add(basicAnimation, forKey: "basicAnimation")
    }
}
