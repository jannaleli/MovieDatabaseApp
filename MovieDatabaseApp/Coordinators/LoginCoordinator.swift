//
//  LoginCoordinator.swift
//  MovieDatabaseApp
//
//  Created by Jann Aleli Zaplan on 2022-03-05.
//

import Foundation
import UIKit

protocol LoginCoordinatorDelegate: AnyObject {
    func goToMain()
}

final class LoginCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let loginViewController: LoginViewController = LoginViewController()
        loginViewController.delegate = self
        self.navigationController.viewControllers = [loginViewController]
    }
    
}

extension LoginCoordinator: LoginCoordinatorDelegate {
    func goToMain() {
        let mainCoordinator = MainCoordinator(navigationController: self.navigationController)
        //loginCoordinator.delegate = self
        childCoordinators.append(mainCoordinator)
        mainCoordinator.start()
    }
}
