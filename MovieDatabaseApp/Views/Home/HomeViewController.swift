//
//  HomeViewController.swift
//  MovieDatabaseApp
//
//  Created by Jann Aleli Zaplan on 2022-03-05.
//

import Foundation
import UIKit

// MARK: - Public Protocol

public protocol HomeViewControllerDelegate: AnyObject {
    func goToDetailsView()
}

class HomeViewController: UIViewController {
    // MARK: - Public Properties

    weak var delegate: HomeViewControllerDelegate?
    var homeView = HomeView()

    // MARK: - Override

    override func loadView() {
        homeView.delegate = self
        view = homeView
    }
}

extension HomeViewController: HomeViewDelegate {
    func cellSelected() {
        delegate?.goToDetailsView()
    }
}
