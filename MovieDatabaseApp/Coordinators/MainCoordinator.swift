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
        let viewModel = MovieViewModel()
        let homeViewController = HomeViewController(movieViewModel: viewModel)
        homeViewController.delegate = self
        navigationController?.viewControllers = [homeViewController]
    }

    private func startHomeView() {
        navigationController?.popViewController(animated: true)
    }

    private func startDetailsView() {
        let detailViewController = DetailViewController()
        detailViewController.delegate = self
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

// MARK: - Delegate Methods

extension MainCoordinator: HomeViewControllerDelegate {
    func goToDetailsView() {
        startDetailsView()
    }
}

// MARK: - Factory

extension MainCoordinator: DetailViewControllerDelegate {
    func goToHomeView() {
        startHomeView()
    }
}
