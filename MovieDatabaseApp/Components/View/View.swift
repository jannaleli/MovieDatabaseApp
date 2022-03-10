//
//  View.swift
//  MovieDatabaseApp
//
//  Created by Jann Zaplan on 2022-03-10.
//

import Foundation
import UIKit

extension UIView {
    func makeButton(_ buttonType: ButtonType) -> UIButton {
        let buttonToMain = UIButton()
        var config = buttonToMain.getConfig()

        switch buttonType {
        case .login:
            config.title = "Login"
        case .register:
            config.title = "Register"
        }
        config.baseBackgroundColor = .systemBlue
        config.cornerStyle = .large
        config.image = UIImage(systemName: "chevron.right")
        config.imagePadding = 5
        config.imagePlacement = .trailing
        buttonToMain.setConfig(config: config)
        buttonToMain.isUserInteractionEnabled = true

        return buttonToMain
    }

    func makeTextField(_ textFieldType: TextFieldType) -> UITextField {
        let textField = UITextField()

        switch textFieldType {
        case .username:
            textField.placeholder = "Username"
        case .password:
            textField.placeholder = "Password"
            textField.isSecureTextEntry = true
        }

        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect

        return textField
    }
}
