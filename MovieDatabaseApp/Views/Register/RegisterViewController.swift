//
//  RegisterViewController.swift
//  MovieDatabaseApp
//
//  Created by Jann Aleli Zaplan on 2022-03-05.
//

import Foundation
import UIKit

public protocol RegisterViewControllerDelegate: AnyObject {
    func registerCompleted()
}

class RegisterViewController: UIViewController {
    // MARK: - Public Properties

    weak var delegate: RegisterViewControllerDelegate?
    var registerView = RegisterView()

    // MARK: - Override

    override func loadView() {
        registerView.delegate = self
        view = registerView
    }
}

extension RegisterViewController: RegisterViewDelegate {
    func registerSelected() {
        delegate?.registerCompleted()
    }
}
