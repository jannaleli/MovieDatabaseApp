//
//  LoginViewController.swift
//  MovieDatabaseApp
//
//  Created by Jann Aleli Zaplan on 2022-03-05.
//

import Foundation
import UIKit

public protocol LoginViewControllerDelegate: AnyObject {
    func loginCompleted()
}

class LoginViewController: UIViewController {
    // MARK: - Public Properties

    weak var delegate: LoginViewControllerDelegate?
    var loginView = LoginView()

    // MARK: - Override

    override func loadView() {
        loginView.delegate = self
        view = loginView
    }
}

extension LoginViewController: LoginViewDelegate {
    func loginSelected() {
        delegate?.loginCompleted()
    }
}
