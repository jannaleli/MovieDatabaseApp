//
//  LoginViewController.swift
//  MovieDatabaseApp
//
//  Created by Jann Aleli Zaplan on 2022-03-05.
//

import Foundation
import UIKit

public protocol LoginViewControllerDelegate: AnyObject {
    func goToMainView()
}

class LoginViewController: UIViewController {
    weak var delegate: LoginCoordinatorDelegate?
    var loginView = LoginView()
    
    override func loadView() {
        loginView.delegate = self
        view = loginView
    }
}

extension LoginViewController: LoginViewControllerDelegate {
    func goToMainView() {
        delegate?.goToMain()
    }
}
