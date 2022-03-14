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
    var sampleData: [HomeViewModel] = []

    // MARK: - Override

    override func loadView() {
        MovieListAPI().getMovies(completionBlock: {
            result, _ in
            // This is where we will load ViewModel after calling the MovieListAPI
            if let data = result as? [MovieItem] {
                self.sampleData = data.map { HomeViewModel(movie: $0) }
            }

        })

        homeView.delegate = self
        homeView.configure(with: sampleData)
        view = homeView
    }
}

extension HomeViewController: HomeViewDelegate {
    func cellSelected() {
        delegate?.goToDetailsView()
    }
}
