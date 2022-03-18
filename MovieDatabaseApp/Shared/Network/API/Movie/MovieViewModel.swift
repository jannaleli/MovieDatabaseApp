//
//  MovieViewModel.swift
//  MovieDatabaseApp
//
//  Created by Jann Zaplan on 2022-03-15.
//

import Combine
import Foundation
// TODO: HomeViewModel rename
class MovieViewModel: ObservableObject {
    @Published var movies = [MovieItemCellViewModel]()
    @Published var upcomingMovies = [MovieItemCellViewModel]()
    @Published var moviesListLoadingError: String = ""
    @Published var showAlert: Bool = false

    private var cancellableSet: Set<AnyCancellable> = []
    var dataManager: NetworkServiceProtocol

    init(dataManager: NetworkServiceProtocol = NetworkService.shared) {
        self.dataManager = dataManager
    }

    func getUpcomingMovies() {
        dataManager.fetchUpcomingMovies()
            .sink {
                dataResponse in

                if dataResponse.error != nil {
                    self.createAlert(with: dataResponse.error!)
                } else {
                    guard let data = dataResponse.value?.results as? [MovieItem] else {
                        return
                    }
                    self.upcomingMovies = data.map { MovieItemCellViewModel(movie: $0) }
                }
            }.store(in: &cancellableSet)
    }

    func getMovieList() {
        dataManager.fetchMovies()
            .sink {
                dataResponse in

                if dataResponse.error != nil {
                    self.createAlert(with: dataResponse.error!)
                } else {
                    guard let data = dataResponse.value?.results as? [MovieItem] else {
                        return
                    }
                    self.movies = data.map { MovieItemCellViewModel(movie: $0) }
                }
            }.store(in: &cancellableSet)
    }

    func createAlert(with error: NetworkError) {
        moviesListLoadingError = error.backendError == nil ? error.initialError.localizedDescription : error.backendError!.message
        showAlert = true
    }
}
