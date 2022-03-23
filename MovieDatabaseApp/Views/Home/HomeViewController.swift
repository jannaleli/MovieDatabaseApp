//
//  HomeViewController.swift
//  MovieDatabaseApp
//
//  Created by Jann Aleli Zaplan on 2022-03-05.
//

import Combine
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
    var data = [MovieItem]()
    var homeViewModel: HomeViewModel

    private var cancellableSet: Set<AnyCancellable> = .init()

    // MARK: Initializers

    init(homeViewModel: HomeViewModel) {
        self.homeViewModel = homeViewModel

        super.init(nibName: nil, bundle: nil)
        setupBindings()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Override

    override func viewDidLoad() {
        homeViewModel.getMovieList()
        homeViewModel.getUpcomingMovies()
    }

    override func loadView() {
        homeView.delegate = self
        view = homeView
    }

    // MARK: Private

    private func setupBindings() {
        // output
//
//        movieViewModel.$movies
//            .receive(on: DispatchQueue.main)
//            .sink { [weak self] movieList in
//                guard let self = self else {
//                    return
//                }
//                // TODO: Remove the mapping because already done HomeViewModel
//
//                self.homeView.configure(with: movieList) // TODO: could be renamed to Bind
//            }.store(in: &cancellableSet)
//
//        movieViewModel.$upcomingMovies
//            .receive(on: DispatchQueue.main)
//            .sink { [weak self] movieList in
//                guard let self = self else {
//                    return
//                }
//                // TODO: Remove the mapping because already done HomeViewModel
//
//                self.homeView.configure(with: movieList) // TODO: could be renamed to Bind
//            }.store(in: &cancellableSet)

        Publishers
            .CombineLatest(
                homeViewModel.$upcomingMovies,
                homeViewModel.$movies
            )
            .receive(on: DispatchQueue.main)
            .sink { [weak self] upcomingMovies, movieList in
                guard let self = self else {
                    return
                }
                // TODO: Remove the mapping because already done HomeViewModel

                self.homeView.configure(with: movieList, and: upcomingMovies) // TODO: could be renamed to Bind
            }.store(in: &cancellableSet)
    }
}

extension HomeViewController: HomeViewDelegate {
    func cellSelected() {
        delegate?.goToDetailsView()
    }
}
