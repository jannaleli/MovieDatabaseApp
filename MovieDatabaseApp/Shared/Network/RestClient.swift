//
//  RestClient.swift
//  MovieDatabaseApp
//
//  Created by Jann Zaplan on 2022-03-11.
//
import Alamofire
import Foundation
import SwiftyJSON

typealias ServerCompletionBlock = (_ result: RestResponse?, _ error: NSError?) -> Void
typealias CompletionBlock = (_ result: AnyObject?, _ error: NSError?) -> Void

class RestClient {
    // MARK: Send Request to TMDB API

    func sendRequest(_ route: URLRequestConvertible, completionBlock _: @escaping ServerCompletionBlock) {
        let request = AF.request(route, interceptor: nil)

        request.responseJSON(completionHandler: {
            result in
            print(result)
        })
    }
}
