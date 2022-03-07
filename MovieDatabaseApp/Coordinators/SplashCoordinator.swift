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
        
        self.navigationController = UINavigationController()
        self.window = UIWindow(windowScene: scene)
    }
    // MARK: - Public Methods
    func start() {
        let splashViewController: SplashViewController = SplashViewController()
        splashViewController.delegate = self
        self.navigationController.viewControllers = [splashViewController]
        loading()
    }
    // MARK: - Private Methods
    private func loading() {
        window.rootViewController = self.navigationController
        window.makeKeyAndVisible()
    }
    
    
}
// MARK: - SplashCoordinatorDelegate
extension SplashCoordinator: SplashCoordinatorDelegate {
    
    func goToLogin() {
       
        let loginCoordinator = LoginCoordinator(navigationController: self.navigationController)

        childCoordinators.append(loginCoordinator)
        loginCoordinator.start()
        
    }
    
    func goToRegister() {
   
        let registerCoordinator = RegisterCoordinator(navigationController: self.navigationController)
        
        childCoordinators.append(registerCoordinator)
        registerCoordinator.start()
    }
}
