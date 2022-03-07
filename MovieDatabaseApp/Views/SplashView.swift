//
//  FirstView.swift
//  iOS-Platform-Training
//
//  Created by Jann Zaplan on 2022-03-02.
//

import Foundation
import UIKit
import CLTypingLabel

protocol SplashViewDelegate: AnyObject {
    func goToLogin(in view: SplashView)
    func goToRegister(in view: SplashView)
}

class SplashView: UIView {

    // MARK: - Public Properties
    weak var delegate: SplashViewControllerDelegate?

    // MARK: - Private Properties
    
    var titleLabel: CLTypingLabel =  CLTypingLabel()
    
    private lazy var buttonToLogin: UIButton = {
        let buttonToLogin = UIButton()
        var config = buttonToLogin.getConfig()
        config.title = "Login"
        config.baseBackgroundColor = .systemBlue
        config.cornerStyle = .medium
        config.preferredSymbolConfigurationForImage
          = UIImage.SymbolConfiguration(scale: .medium)
        buttonToLogin.setConfig(config: config)
        buttonToLogin.isUserInteractionEnabled = true
        buttonToLogin.addAction(
          UIAction { _ in
              self.handleButtonToLoginTapped()
          }, for: .touchDown
        )
        return buttonToLogin
    }()
    
    private lazy var buttonToRegister: UIButton = {
        let buttonToRegister = UIButton()
        var config = buttonToRegister.getConfig()
        config.title = "Register"
        config.baseBackgroundColor = .systemBlue
        config.cornerStyle = .medium

        buttonToRegister.setConfig(config: config)
        buttonToRegister.addAction(
          UIAction { _ in
              self.handleButtonToRegisterTapped()
          }, for: .touchDown
        )
        return buttonToRegister
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20.0
        stack.alignment = .fill
        stack.distribution = .fillEqually
        [self.titleLabel,
         self.buttonToLogin,
         self.buttonToRegister
      ].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    
    // MARK: - Initialization
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
    
    // MARK: - Methods
    
    private func setGeneralConfigurations() {
        backgroundColor = .white
    }
    
    private func createSubviews() {

        titleLabel.textColor = .systemBlue
        let attributes: [NSAttributedString.Key: Any] = [ NSAttributedString.Key.kern: 2]
        titleLabel.attributedText = NSAttributedString(string: "Movie Database \u{1F3A5}", attributes: attributes)
        titleLabel.textAlignment = .center
        
        titleLabel.font = UIFont (name: "Helvetica Neue", size: 30)
        addSubview(stackView)

    }
    
    private func setUpConstraints() {
        
   
        stackView.center(centerX: layoutMarginsGuide.centerXAnchor, centerY: layoutMarginsGuide.centerYAnchor)
        stackView.setSize(width: 400, height: 150)
        stackView.anchor(top: nil,
                            paddingTop: 10,
                            bottom: nil,
                            paddingBottom: 10,
                            left: layoutMarginsGuide.leadingAnchor,
                            paddingLeft: 10,
                            right: layoutMarginsGuide.trailingAnchor,
                            paddingRight: 10,
                            width: 0,
                            height: 0)
            


        
      
    }
    // MARK: - Button Actions
    @objc func handleButtonToLoginTapped() {
        
        delegate?.goToLogin()
    }
    
    @objc func handleButtonToRegisterTapped() {
      
        delegate?.goToRegister()
    }
}




