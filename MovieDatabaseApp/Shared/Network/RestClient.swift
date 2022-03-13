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

    func sendRequest(_ route: URLRequestConvertible, completionBlock completionBlock: @escaping ServerCompletionBlock) {
        let request = AF.request(route, interceptor: nil)

        request.responseData { response in
            switch response.result {
            case let .success(value):
                print(String(data: value, encoding: .utf8)!)

                let restResponse: RestResponse = .init(dataFromNetwork: value)
                completionBlock(restResponse, nil)
            case let .failure(error):
                print(error)
                completionBlock(nil, error as NSError)
            }
        }

//        request.responseJSON(completionHandler: {
//            response in
//            print(response.result)
//            let restResponse: RestResponse = .init(dataFromNetwork: response.result)
//
//            completionBlock(restResponse, nil)
//        })
    }
}
