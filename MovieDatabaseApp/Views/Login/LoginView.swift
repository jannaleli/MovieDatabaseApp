//
//  LoginView.swift
//  MovieDatabaseApp
//
//  Created by Jann Aleli Zaplan on 2022-03-05.
//

import Alertift
import Firebase
import Foundation
import UIKit

protocol LoginViewDelegate: AnyObject {
    func loginSelected()
}

class LoginView: UIView {
    // MARK: - Public Properties

    weak var delegate: LoginViewDelegate?

    // MARK: - Private Properties

    private lazy var buttonToMain: UIButton = makeButton(.login)

    private lazy var usernameField: UITextField = makeTextField(.username)

    private lazy var passwordField: UITextField = makeTextField(.password)

    private lazy var stackView: UIStackView = makeStack()

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        setGeneralConfigurations()
        createSubviews()
        setUpConstraints()
        addAction()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setGeneralConfigurations()
        createSubviews()
        setUpConstraints()
        addAction()
    }

    // MARK: - Private Methods

    private func setGeneralConfigurations() {
        backgroundColor = .white
    }

    private func createSubviews() {
        addSubview(stackView)
    }

    private func addAction() {
        buttonToMain.addAction(
            UIAction { _ in
                self.handleButtonToMainTapped()
            }, for: .touchDown
        )
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
        if let email = usernameField.text, let password = passwordField.text {
            Auth.auth().signIn(withEmail: email, password: password, completion: { [self]
                _, error in

                if let e = error {
                    // TODO: Place an error completion block in here
                    makeErrorAlert(message: e.localizedDescription)
                } else {
                    delegate?.loginSelected()
                }

            })
        }
    }
}

// MARK: - Factory

extension LoginView {
    func makeErrorAlert(message: String) {
        Alertift.alert(title: "Error", message: message)
            .action(.default("Ok"))
            .show(on: findViewController())
    }

    func makeStack() -> UIStackView {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20.0
        stack.alignment = .fill
        stack.distribution = .fillEqually
        [usernameField,
         passwordField,
         buttonToMain].forEach { stack.addArrangedSubview($0) }
        return stack
    }
}
