//
//  FirstView.swift
//  iOS-Platform-Training
//
//  Created by Jann Zaplan on 2022-03-02.
//

import CLTypingLabel
import Foundation
import UIKit

protocol SplashViewDelegate: AnyObject {
    func goToLogin()
    func goToRegister()
}

class SplashView: UIView {
    // MARK: - Public Properties

    weak var delegate: SplashViewDelegate?

    // MARK: - Private Properties

    var titleLabel: CLTypingLabel = .init()

    private lazy var buttonToLogin: UIButton = makeButton(.login)

    private lazy var buttonToRegister: UIButton = makeButton(.register)

    private lazy var stackView: UIStackView = makeStackView()

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        setGeneralConfigurations()
        createSubviews()
        setUpConstraints()
        addActions()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setGeneralConfigurations()
        createSubviews()
        setUpConstraints()
        addActions()
    }

    // MARK: - Methods

    private func setGeneralConfigurations() {
        backgroundColor = .white
    }

    private func createSubviews() {
        titleLabel.textColor = .systemBlue
        let attributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.kern: 2]
        titleLabel.attributedText = NSAttributedString(string: "Movie Database \u{1F3A5}", attributes: attributes)
        titleLabel.textAlignment = .center

        titleLabel.font = UIFont(name: "Helvetica Neue", size: 30)
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

    private func addActions() {
        buttonToLogin.addAction(
            UIAction { _ in
                self.handleButtonToLoginTapped()
            }, for: .touchDown
        )

        buttonToRegister.addAction(
            UIAction { _ in
                self.handleButtonToRegisterTapped()
            }, for: .touchDown
        )
    }

    // MARK: - Button Actions

    @objc func handleButtonToLoginTapped() {
        delegate?.goToLogin()
    }

    @objc func handleButtonToRegisterTapped() {
        delegate?.goToRegister()
    }
}

// MARK: - Factory

extension SplashView {
    func makeStackView() -> UIStackView {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20.0
        stack.alignment = .fill
        stack.distribution = .fillEqually
        [titleLabel,
         buttonToLogin,
         buttonToRegister].forEach { stack.addArrangedSubview($0) }
        return stack
    }
}
