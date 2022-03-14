//
//  AuthCoordinator.swift
//  MovieDatabaseApp
//
//  Created by Jann Zaplan on 2022-03-08.
//

import Foundation
import UIKit

protocol AuthCoordinatorDelegate: AnyObject {
    func authIsCompleted()
}

final class AuthCoordinator: Coordinator {
    // MARK: - Public Properties

    var childCoordinators = [Coordinator]()

    weak var navigationController: UINavigationController?

    weak var delegate: AuthCoordinatorDelegate?

    // MARK: - Initialization

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    // MARK: - Public Methods

    func start() {
        startSplashView()
    }

    private func startLogin() {
        let loginViewController = LoginViewController()
        loginViewController.delegate = self
        navigationController?.viewControllers = [loginViewController]
    }

    private func startRegistration() {
        let registerViewController = RegisterViewController()
        registerViewController.delegate = self
        navigationController?.viewControllers = [registerViewController]
    }

    private func startSplashView() {
        let splashViewController = SplashViewController()
        splashViewController.delegate = self
        navigationController?.viewControllers = [splashViewController]
    }
}

extension AuthCoordinator: SplashViewControllerDelegate {
    func goToLogin() {
        startLogin()
    }

    func goToRegister() {
        startRegistration()
    }
}

extension AuthCoordinator: LoginViewControllerDelegate {
    func loginCompleted() {
        delegate?.authIsCompleted()
    }
}

extension AuthCoordinator: RegisterViewControllerDelegate {
    func registerCompleted() {
        delegate?.authIsCompleted()
    }
}
