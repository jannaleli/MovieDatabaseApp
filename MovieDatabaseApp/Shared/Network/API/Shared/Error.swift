//
//  Error.swift
//  MovieDatabaseApp
//
//  Created by Jann Zaplan on 2022-03-15.
//

import Alamofire
import Foundation

struct NetworkError: Error {
    let initialError: AFError
    let backendError: BackendError?
}

struct BackendError: Codable, Error {
    var status: String
    var message: String
}
