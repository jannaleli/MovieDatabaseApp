//
//  FirstView.swift
//  iOS-Platform-Training
//
//  Created by Jann Zaplan on 2022-03-02.
//

import Foundation
import UIKit

protocol SplashViewDelegate: AnyObject {
    func goToLogin(in view: SplashView)
    func goToRegister(in view: SplashView)
}

class SplashView: UIView {

    
    weak var delegate: SplashViewControllerDelegate?

    lazy var buttonToLogin: UIButton = {
        let buttonToLogin = UIButton()
        buttonToLogin.setTitle("Login", for: .normal)
        buttonToLogin.backgroundColor = .black
        buttonToLogin.isUserInteractionEnabled = true
        let loginTap = UITapGestureRecognizer(target: self, action: #selector(handleButtonToLoginTapped(sender:)))
        buttonToLogin.addGestureRecognizer(loginTap)
        return buttonToLogin
    }()
    
    lazy var buttonToRegister: UIButton = {
        let buttonToRegister = UIButton()
        buttonToRegister.backgroundColor = .black
        buttonToRegister.setTitle("Register", for: .normal)
        let registerTap = UITapGestureRecognizer(target: self, action: #selector(handleButtonToRegisterTapped(sender:)))
        buttonToRegister.addGestureRecognizer(registerTap)
        return buttonToRegister
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 20.0
        stack.alignment = .fill
        stack.distribution = .fillEqually
        [self.buttonToLogin,
         self.buttonToRegister
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
        

        buttonToLogin.setSize(width: 100, height: 50)
        buttonToRegister.setSize(width: 100, height: 50)
        
        stackView.anchor(top: nil,
                            paddingTop: -19,
                            bottom: layoutMarginsGuide.bottomAnchor,
                            paddingBottom: 0,
                            left: layoutMarginsGuide.leadingAnchor,
                            paddingLeft: 10,
                            right: layoutMarginsGuide.trailingAnchor,
                            paddingRight: 0,
                            width: 0,
                            height: 0)
            


        
      
    }
    
    @objc func handleButtonToLoginTapped(sender: UITapGestureRecognizer) {
      
        delegate?.goToLogin()
    }
    
    @objc func handleButtonToRegisterTapped(sender: UITapGestureRecognizer) {
      
        delegate?.goToRegister()
    }
}




