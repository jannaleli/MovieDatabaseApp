//
//  MovieList.swift
//  MovieDatabaseApp
//
//  Created by Jann Zaplan on 2022-03-11.
//

import Alamofire
import Foundation
import SwiftyJSON

class MovieListAPI: RestClient {
    enum MovieListRoute: URLRequestConvertible {
        static var baseURL = APIConstants.BASE_URL
        static let getMoviesURL = "discover/movie?api_key=b7267083305bc71010c161d810acf96e&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate"

        case getMovies

        var method: Alamofire.HTTPMethod {
            switch self {
            case .getMovies: return .get
            }
        }

        var parameters: Parameters? {
            switch self {
            default:
                return nil
            }
        }

        var path: String {
            switch self {
            case .getMovies: return MovieListRoute.getMoviesURL
            }
        }

        func asURLRequest() throws -> URLRequest {
            let url = try URL(string: (MovieListRoute.baseURL + path).removingPercentEncoding!)
            var request = URLRequest(url: url!)
            request.httpMethod = method.rawValue
            request.timeoutInterval = TimeInterval(10 * 1000)
            return try URLEncoding.default.encode(request, with: parameters)
        }
    }

    public func getMovies(completionBlock: @escaping CompletionBlock) {
        let route: URLRequestConvertible = MovieListRoute.getMovies

        sendRequest(route, completionBlock: {
            (response: RestResponse?, _: NSError?) in

                guard let data = response?.data else {
                    // Error
                    completionBlock(nil, NSError(domain: APIConstants.DOMAIN, code: 0, userInfo: nil))
                    return
                }

                print(response)

        })
    }
}
