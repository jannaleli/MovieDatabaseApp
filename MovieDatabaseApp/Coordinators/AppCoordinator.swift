//
//  BaseCoordinator.swift
//  MovieDatabaseApp
//
//  Created by Jann Aleli Zaplan on 2022-03-05.
//

import Foundation
import UIKit

final class AppCoordinator: Coordinator {
    // MARK: - Public Properties

    var childCoordinators = [Coordinator]()

    var navigationController: UINavigationController

    var window = UIWindow()

    var dependencyContainer: AppDependencyContaner

    // MARK: - Initialization

    init(scene: UIWindowScene, dependencyContainer: AppDependencyContaner) {
        navigationController = UINavigationController()
        window = UIWindow(windowScene: scene)
        self.dependencyContainer = dependencyContainer
    }

    // MARK: - Public Methods

    func start() {
        startAuthFlow()
        loading()
    }

    // MARK: - Private Methods

    private func loading() {
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }

    private func startAuthFlow() {
        let coordinator = AuthCoordinator(navigationController: navigationController)
        coordinator.delegate = self
        childCoordinators = [coordinator]
        coordinator.start()
    }

    private func startMainFlow() {
        let coordinator = MainCoordinator(navigationController: navigationController)
        // coordinator.delegate = self - To be implemented later in MainCoordinator
        childCoordinators = [coordinator]
        coordinator.start()
    }
}

extension AppCoordinator: AuthCoordinatorDelegate {
    func authIsCompleted() {
        startMainFlow()
    }
}
