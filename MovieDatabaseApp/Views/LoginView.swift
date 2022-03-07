//
//  LoginView.swift
//  MovieDatabaseApp
//
//  Created by Jann Aleli Zaplan on 2022-03-05.
//

import Foundation
import UIKit

protocol LoginViewDelegate: AnyObject {
    func goToMain(in view: LoginView)
}

class LoginView: UIView {
    weak var delegate: LoginViewControllerDelegate?

    lazy var buttonToMain: UIButton = {
        let buttonToMain = UIButton()
        buttonToMain.setTitle("Login", for: .normal)
        buttonToMain.backgroundColor = .black
    
        buttonToMain.isUserInteractionEnabled = true
        let mainTap = UITapGestureRecognizer(target: self, action: #selector(handleButtonToMainTapped(sender:)))
        buttonToMain.addGestureRecognizer(mainTap)
        return buttonToMain
    }()
    
    lazy var usernameField: UITextField = {
        let usernameField = UITextField()
        usernameField.backgroundColor = .white
        usernameField.borderStyle = .roundedRect
        return usernameField
    }()
    
    lazy var passwordField: UITextField = {
        let passwordField = UITextField()
        passwordField.backgroundColor = .white
        passwordField.borderStyle = .roundedRect
        passwordField.isSecureTextEntry = true

        return passwordField
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20.0
        stack.alignment = .fill
        stack.distribution = .fillEqually
        [self.usernameField,
         self.passwordField,
         self.buttonToMain
      ].forEach { stack.addArrangedSubview($0) }
        return stack
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setGeneralConfigurations()
        createSubviews()
        setUpConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setGeneralConfigurations()
        createSubviews()
        setUpConstraints()
    }
    
    func setGeneralConfigurations() {
        backgroundColor = .white
    }
    
    func createSubviews() {

  
        addSubview(stackView)
        
    
        
        
    }
    
    func setUpConstraints() {
        

        buttonToMain.setSize(width: 100, height: 50)
        stackView.setSize(width: 400, height: 200)
        stackView.center(centerX: layoutMarginsGuide.centerXAnchor, centerY: layoutMarginsGuide.centerYAnchor)
//        stackView.anchor(top: layoutMarginsGuide.topAnchor,
//                         paddingTop: 10,
//                         bottom: layoutMarginsGuide.bottomAnchor,
//                         paddingBottom: 10,
//                         left: layoutMarginsGuide.leadingAnchor,
//                         paddingLeft: 10,
//                         right: layoutMarginsGuide.trailingAnchor,
//                         paddingRight: 10,
//                         width: 0,
//                         height: 0)
            


        
      
    }
    
    @objc func handleButtonToMainTapped(sender: UITapGestureRecognizer) {
      
        delegate?.goToMainView()
    }
    
  
}
