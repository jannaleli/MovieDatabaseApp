//
//  HomeViewController.swift
//  MovieDatabaseApp
//
//  Created by Jann Aleli Zaplan on 2022-03-05.
//

import Foundation
import UIKit

// MARK: - Public Protocol

public protocol MainViewControllerDelegate: AnyObject {
    func goToDetailsView()
}

class HomeViewController: UIViewController {
    // MARK: - Public Properties

    var delegate: MainCoordinatorDelegate?
    var mainView = HomeView()

    // MARK: - Override

    override func loadView() {
        mainView.delegate = self
        view = mainView
    }
}

extension HomeViewController: MainViewControllerDelegate {
    func goToDetailsView() {
        delegate?.goToDetailsView()
    }
}
