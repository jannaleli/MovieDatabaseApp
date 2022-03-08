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
        let mainViewController = MainViewController()
        mainViewController.delegate = self
        navigationController?.viewControllers = [mainViewController]
    }
}

// MARK: - Delegate Methods

extension MainCoordinator: MainCoordinatorDelegate {
    func goToDetailsView() {}
}

// MARK: - Factory

extension MainCoordinator {}
