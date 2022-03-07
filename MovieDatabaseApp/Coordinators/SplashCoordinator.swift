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
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    var window = UIWindow()
    
    init(scene: UIWindowScene) {
        self.navigationController  = UINavigationController()
        self.window = UIWindow(windowScene: scene)
    }
    
    func start() {
        let splashViewController: SplashViewController = SplashViewController()
        splashViewController.delegate = self
        self.navigationController.viewControllers = [splashViewController]
        loading()
    }
    
    func loading() {
        window.rootViewController = self.navigationController
        window.makeKeyAndVisible()
    }
    
    
}

extension SplashCoordinator: SplashCoordinatorDelegate {
    
    func goToLogin() {
        let loginCoordinator = LoginCoordinator(navigationController: self.navigationController)
        //loginCoordinator.delegate = self
        childCoordinators.append(loginCoordinator)
        loginCoordinator.start()
        
    }
    
    func goToRegister() {
        let registerCoordinator = RegisterCoordinator(navigationController: self.navigationController)
        //loginCoordinator.delegate = self
        childCoordinators.append(registerCoordinator)
        registerCoordinator.start()
    }
}
