//
//  APIConfiguration.swift
//  MovieDatabaseApp
//
//  Created by Jann Zaplan on 2022-03-11.
//

import Foundation

struct APIConstants {
    static let BASE_URL = "https://api.themoviedb.org/3/"
    static let AUTH_ERROR = 102
    static let INVALID_GRANT = 103
    static let ACCESS_DENIED = 104
    static let SERVER_ERROR = 105
    static let BAD_REQUEST = 106
    static let METHOD_NOT_FOUND = 107
    static let RESOURCE_NOT_FOUND = 108
    static let INTERNET_NOT_AVAILABLE = 109
    static let DOMAIN = "api.themoviedb.org"
    static let API_READ_KEY_ACCESS_TOKEN: String? = {
        if let path = Bundle.main.path(forResource: "API", ofType: "plist"),
           let myDict = NSDictionary(contentsOfFile: path)
        {
            return myDict["API_READ_KEY_ACCESS_TOKEN"].debugDescription
        }
        return nil
    }()

    static let API_KEY: String? = {
        if let path = Bundle.main.path(forResource: "API", ofType: "plist"),
           let myDict = NSDictionary(contentsOfFile: path)
        {
            let api_key = myDict["API_KEY"]!
            if let apiKey = api_key as? String {
                return apiKey
            }
            return nil
        }
        return nil

    }()
}
