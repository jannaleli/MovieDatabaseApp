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
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let registerViewController: RegisterViewController = RegisterViewController()
        registerViewController.delegate = self
        self.navigationController.viewControllers = [registerViewController]
    }
    
}

extension RegisterCoordinator: RegisterCoordinatorDelegate {
    func goToMain() {
        let mainCoordinator = MainCoordinator(navigationController: self.navigationController)
        //loginCoordinator.delegate = self
        childCoordinators.append(mainCoordinator)
        mainCoordinator.start()
    }
}
