//
//  RegisterViewController.swift
//  MovieDatabaseApp
//
//  Created by Jann Aleli Zaplan on 2022-03-05.
//

import Foundation
import UIKit


public protocol RegisterViewControllerDelegate: AnyObject {
    func goToMainView()
}

class RegisterViewController: UIViewController {
    weak var delegate: RegisterCoordinatorDelegate?
    var registerView = RegisterView()
    
    override func loadView() {
        registerView.delegate = self
        view = registerView
    }
}

extension RegisterViewController: RegisterViewControllerDelegate {
    func goToMainView() {
        delegate?.goToMain()
    }
}
