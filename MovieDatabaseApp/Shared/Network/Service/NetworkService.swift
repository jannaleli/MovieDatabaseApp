//
//  NetworkService.swift
//  MovieDatabaseApp
//
//  Created by Jann Zaplan on 2022-03-15.
//

import Alamofire
import Combine
import Foundation

protocol NetworkServiceProtocol {
    func fetchMovies() -> AnyPublisher<DataResponse<MovieItemList, NetworkError>, Never>
    func fetchUpcomingMovies() -> AnyPublisher<DataResponse<MovieItemList, NetworkError>, Never>
}

class NetworkService {
    static let shared: NetworkServiceProtocol = NetworkService()
    private init() {}
}

extension NetworkService: NetworkServiceProtocol {
    func fetchMovies() -> AnyPublisher<DataResponse<MovieItemList, NetworkError>, Never> {
        let baseURL = APIConstants.BASE_URL
        let API_KEY = APIConstants.API_KEY!
        let getMoviesURL = "discover/movie?api_key=\(API_KEY)&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate"

        let url = try! (baseURL + getMoviesURL).asURL()
        return AF.request(url, method: .get)
            .validate()
            .publishDecodable(type: MovieItemList.self)
            .map {
                response in response.mapError {
                    error in
                    let backendError = response.data.flatMap { try? JSONDecoder().decode(BackendError.self, from: $0) }
                    return NetworkError(initialError: error, backendError: backendError)
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

    func fetchUpcomingMovies() -> AnyPublisher<DataResponse<MovieItemList, NetworkError>, Never> {
        let baseURL = APIConstants.BASE_URL
        let API_KEY = APIConstants.API_KEY!
        let getMoviesURL = "movie/top_rated?api_key=\(API_KEY)&language=en-US&page=1"

        let url = try! (baseURL + getMoviesURL).asURL()
        return AF.request(url, method: .get)
            .validate()
            .publishDecodable(type: MovieItemList.self)
            .map {
                response in response.mapError {
                    error in
                    let backendError = response.data.flatMap { try? JSONDecoder().decode(BackendError.self, from: $0) }
                    return NetworkError(initialError: error, backendError: backendError)
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
