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
    // MARK: - Public Properties

    weak var delegate: LoginViewControllerDelegate?

    // MARK: - Private Properties

    private lazy var buttonToMain: UIButton = {
        let buttonToMain = UIButton()
        var config = buttonToMain.getConfig()
        config.title = "Login"
        config.baseBackgroundColor = .systemBlue
        config.cornerStyle = .large
        config.image = UIImage(systemName: "chevron.right")
        config.imagePadding = 5
        config.imagePlacement = .trailing
        buttonToMain.setConfig(config: config)
        buttonToMain.isUserInteractionEnabled = true
        buttonToMain.addAction(
            UIAction { _ in
                self.handleButtonToMainTapped()
            }, for: .touchDown
        )
        return buttonToMain
    }()

    private lazy var usernameField: UITextField = {
        let usernameField = UITextField()
        usernameField.placeholder = "Username"
        usernameField.backgroundColor = .white
        usernameField.borderStyle = .roundedRect

        return usernameField
    }()

    private lazy var passwordField: UITextField = {
        let passwordField = UITextField()
        passwordField.placeholder = "Password"
        passwordField.backgroundColor = .white
        passwordField.borderStyle = .roundedRect
        passwordField.isSecureTextEntry = true

        return passwordField
    }()

    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20.0
        stack.alignment = .fill
        stack.distribution = .fillEqually
        [self.usernameField,
         self.passwordField,
         self.buttonToMain].forEach { stack.addArrangedSubview($0) }
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

    // MARK: - Private Methods

    private func setGeneralConfigurations() {
        backgroundColor = .white
    }

    private func createSubviews() {
        addSubview(stackView)
    }

    private func setUpConstraints() {
        buttonToMain.setSize(width: 100, height: 30)
        stackView.setSize(width: 400, height: 200)
        stackView.center(centerX: layoutMarginsGuide.centerXAnchor, centerY: layoutMarginsGuide.centerYAnchor)
        stackView.anchor(top: nil,
                         paddingTop: 10,
                         bottom: nil,
                         paddingBottom: 10,
                         left: layoutMarginsGuide.leadingAnchor,
                         paddingLeft: 5,
                         right: layoutMarginsGuide.trailingAnchor,
                         paddingRight: 2,
                         width: 0,
                         height: 0)
    }

    // MARK: - Button Actions

    @objc func handleButtonToMainTapped() {
        delegate?.goToMainView()
    }
}
