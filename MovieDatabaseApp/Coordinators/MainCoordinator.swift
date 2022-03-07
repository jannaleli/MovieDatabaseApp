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
    // MARK: - Public Properties
    var childCoordinators = [Coordinator]()
    
    weak var navigationController: UINavigationController?
    // MARK: - Initialization
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    // MARK: - Public Methods
    func start() {
        let mainViewController: MainViewController = MainViewController()
        mainViewController.delegate = self
        self.navigationController?.viewControllers = [mainViewController]
    }
}
extension MainCoordinator: MainCoordinatorDelegate {
    func goToDetailsView() {
         
    }
}
