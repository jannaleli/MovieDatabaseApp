//
//  RegisterCoordinator.swift
//  MovieDatabaseApp
//
//  Created by Jann Aleli Zaplan on 2022-03-05.
//

import Foundation
import UIKit
protocol RegisterCoordinatorDelegate: AnyObject {
    func goToMain()
}

final class RegisterCoordinator: Coordinator {
    // MARK: - Public Properties

    var childCoordinators = [Coordinator]()

    weak var navigationController: UINavigationController?

    // MARK: - Initialization

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    // MARK: - Public Methods

    func start() {
        let registerViewController = RegisterViewController()
        registerViewController.delegate = self
        navigationController?.viewControllers = [registerViewController]
    }
}

// MARK: - Register Cpprdomatpr Delegate

extension RegisterCoordinator: RegisterCoordinatorDelegate {
    func goToMain() {
        guard let navigationController = navigationController else { return }
        let mainCoordinator = MainCoordinator(navigationController: navigationController)
        // loginCoordinator.delegate = self
        childCoordinators.append(mainCoordinator)
        mainCoordinator.start()
    }
}

// MARK: - Factory

extension LoginCoordinator {}
