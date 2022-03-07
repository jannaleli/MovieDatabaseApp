//
//  MainCoordinator.swift
//  MovieDatabaseApp
//
//  Created by Jann Aleli Zaplan on 2022-03-05.
//

import Foundation
import UIKit

protocol MainCoordinatorDelegate: AnyObject {
   func goToDetailsView()
}

final class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let mainViewController: MainViewController = MainViewController()
        mainViewController.delegate = self
        self.navigationController.viewControllers = [mainViewController]
    }
}
extension MainCoordinator: MainCoordinatorDelegate {
    func goToDetailsView() {
         
    }
}
