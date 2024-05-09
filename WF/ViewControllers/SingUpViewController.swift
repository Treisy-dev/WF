//
//  SingUpViewController.swift
//  WF
//
//  Created by Кирилл Щёлоков on 16.05.2023.
//

import UIKit
import SnapKit

class SingUpViewController: UIViewController {
    
    private let scrollview = UIScrollView()
    private let containerStackView = UIStackView()
    
    let backButton = CustomBackButton()
    //let backImage = UIImage(named: "backIcon")
    
    private let signUpLabel = UILabel()
    private let createAccountLabel = UILabel()
    
    private var signUpImageView = UIImageView()
    private let signUpImage = UIImage(named: "SignUpLogo")

    private let ClosePasswordImage = UIImage(named: "ClosePasswordButtonImage")
    private let OpenPasswordImage = UIImage(named: "OpenPasswordButtonImage")

    
    private let nameTextField = UITextField()
    private let emailTextField = UITextField()
    private let passwordTextField = UITextField()
    
    private let signUpButton = CustomButton(withStyle: .primary)
    private let logInButton = CustomButton(withStyle: .secondary)
    
    private let openClosePasswordButton = UIButton()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUp()
        
    }
    
    private func setUp() {
        setUpBackButton()
        setUpScrollView()
        setUpSignUpImage()
        setUpSignUpLabel()
        setUpCreateAccountLable()
        setUpTextFields()
        setUpSignUpButton()
        setUpLogInButton()
        setUpopenClosePasswordButton()
    }
    
    private func setUpBackButton(){
        scrollview.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(15)
            make.top.equalToSuperview().offset(20)
            make.height.width.equalTo(48)
        }
        backButton.addTarget(self, action: #selector(tap), for: .touchUpInside)
    }
        
    
    @objc
    private func tap(){
        print("AAAAA")
    }
    
    private func setUpScrollView() {
        view.addSubview(scrollview)
        
        scrollview.showsVerticalScrollIndicator = false
        scrollview.snp.makeConstraints { make in
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.top.equalTo(view.snp.top)
            make.bottom.equalTo(view.snp.bottom)
        }
        scrollview.addSubview(containerStackView)
        
        containerStackView.spacing = 16
        
        containerStackView.axis = .vertical
        containerStackView.snp.makeConstraints{ make in
            make.trailing.equalToSuperview().inset(16)
            make.leading.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(100)
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
    }
    
    private func setUpSignUpLabel() {
        containerStackView.addArrangedSubview(signUpLabel)
        
        signUpLabel.text = "Sign Up"
        signUpLabel.textColor = .appDarkGray
        signUpLabel.font = .appRubic?
        signUpLabel.textAlignment = .center
        
        containerStackView.setCustomSpacing(8, after: signUpLabel)
    }
    
    private func setUpCreateAccountLable() {
        containerStackView.addArrangedSubview(createAccountLabel)
        
        createAccountLabel.text = "Create your account"
        createAccountLabel.textColor = .appMidGray
        signUpLabel.font = .appRubic?.withSize(14)
        createAccountLabel.textAlignment = .center
        
        
    }
    
    private func setUpSignUpImage() {
        signUpImageView = UIImageView(frame: containerStackView.bounds)
        signUpImageView.image = signUpImage
        signUpImageView.center = view.center
        containerStackView.addArrangedSubview(signUpImageView)
    }
    
    private func setUpTextFields() {
        containerStackView.addArrangedSubview(nameTextField)
        containerStackView.addArrangedSubview(emailTextField)
        containerStackView.addArrangedSubview(passwordTextField)
        
        
        
        nameTextField.placeholder = "Name"
        emailTextField.placeholder = "E-mail"
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        
        let createBorder = { (textField : UITextField) in
            
            textField.layer.borderColor = UIColor.appMidGray!.cgColor
            textField.textColor = .appMidGray
            
            textField.layer.cornerRadius = 10
            textField.layer.borderWidth = 1
            
            textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: textField.frame.height))
            textField.leftViewMode = .always
            
            textField.snp.makeConstraints { make in
                make.height.equalTo(53)
            }
        }
        
        createBorder(nameTextField)
        createBorder(passwordTextField)
        createBorder(emailTextField)
                
        }
    
    private func setUpSignUpButton() {
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.snp.makeConstraints { make in
            make.height.equalTo(56)
        }
        containerStackView.addArrangedSubview(signUpButton)
        signUpButton.addTarget(self, action: #selector(signUpButtonAction), for: .touchUpInside)
    }
    
    private func setUpLogInButton() {
        logInButton.setTitle("Log In", for: .normal)
        logInButton.snp.makeConstraints { make in
            make.height.equalTo(16)
        }
        containerStackView.addArrangedSubview(logInButton)
        logInButton.addTarget(self, action: #selector(signUpButtonAction), for: .touchUpInside)

    }
    
    private func setUpopenClosePasswordButton() {
        passwordTextField.addSubview(openClosePasswordButton)
        openClosePasswordButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(14.5)
            make.bottom.equalToSuperview().inset(14.5)
            make.trailing.equalToSuperview().offset(16)
            make.leading.equalToSuperview().inset(303)
        }
        
        openClosePasswordButton.setImage(ClosePasswordImage, for: .normal)
        
        openClosePasswordButton.addTarget(self, action: #selector(openCloseButtonAtion), for: .touchUpInside)
    }
    
    @objc
    private func openCloseButtonAtion(){
        passwordTextField.isSecureTextEntry = passwordTextField.isSecureTextEntry ? false : true
        openClosePasswordButton.setImage(passwordTextField.isSecureTextEntry ? ClosePasswordImage : OpenPasswordImage, for: .normal)
    }
    
    @objc
    private func signUpButtonAction(){
        let tb = CustomTabBarController()
        
        let vc1 = DictionaryViewController()
        
        let vc2 = TrainingViewController()

        let vc3 = VideoViewController()

        
        tb.viewControllers = [UINavigationController(rootViewController: vc1),
                              UINavigationController(rootViewController: vc2),
                              UINavigationController(rootViewController: vc3)]
        
        navigationController?.pushViewController(tb, animated: true)
    }
    
    
}
