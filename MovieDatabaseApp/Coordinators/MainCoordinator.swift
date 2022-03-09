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
        let homeViewController = HomeViewController()
        homeViewController.delegate = self
        navigationController?.viewControllers = [homeViewController]
    }

    private func startHomeView() {}

    private func startDetailsView() {}
}

// MARK: - Delegate Methods

extension MainCoordinator: HomeViewControllerDelegate {
    func goToDetailsView() {
        startDetailsView()
    }

    func goToHomeView() {
        startHomeView()
    }
}

// MARK: - Factory

extension MainCoordinator {}
