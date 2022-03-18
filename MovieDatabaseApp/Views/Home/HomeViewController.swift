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
    var sampleData: [HomeViewModel] = []
    var movieViewModel: MovieViewModel

    private var cancellableSet: Set<AnyCancellable> = .init()

    // MARK: Initializers

    init(movieViewModel: MovieViewModel) {
        self.movieViewModel = movieViewModel

        super.init(nibName: nil, bundle: nil)
        setupBindings()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Override

    override func viewDidLoad() {
        movieViewModel.getMovieList()
        movieViewModel.getUpcomingMovies()
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
                movieViewModel.$upcomingMovies,
                movieViewModel.$movies
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
