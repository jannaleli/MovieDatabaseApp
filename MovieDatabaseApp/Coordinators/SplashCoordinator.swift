//
//  BaseCoordinator.swift
//  MovieDatabaseApp
//
//  Created by Jann Aleli Zaplan on 2022-03-05.
//

import Foundation
import UIKit

protocol SplashCoordinatorDelegate: AnyObject {
    func goToLogin()
    func goToRegister()
}

final class SplashCoordinator: Coordinator {
    // MARK: - Public Properties

    var childCoordinators = [Coordinator]()

    var navigationController: UINavigationController

    var window = UIWindow()

    // MARK: - Initialization

    init(scene: UIWindowScene) {
        navigationController = UINavigationController()
        window = UIWindow(windowScene: scene)
    }

    // MARK: - Public Methods

    func start() {
        let splashViewController = SplashViewController()
        splashViewController.delegate = self
        navigationController.viewControllers = [splashViewController]
        loading()
    }

    // MARK: - Private Methods

    private func loading() {
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}

// MARK: - SplashCoordinatorDelegate

extension SplashCoordinator: SplashCoordinatorDelegate {
    func goToLogin() {
        let loginCoordinator = LoginCoordinator(navigationController: navigationController)

        childCoordinators.append(loginCoordinator)
        loginCoordinator.start()
    }

    func goToRegister() {
        let registerCoordinator = RegisterCoordinator(navigationController: navigationController)

        childCoordinators.append(registerCoordinator)
        registerCoordinator.start()
    }
}

// MARK: - Factory

extension SplashCoordinator {}
