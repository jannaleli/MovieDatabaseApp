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
    static let API_READ_KEY_ACCESS_TOKEN = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiNzI2NzA4MzMwNWJjNzEwMTBjMTYxZDgxMGFjZjk2ZSIsInN1YiI6IjYyMmI2NzllNDk4ZWY5MDA0NGZhNTgxMiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.-82sDA8MrNo00I1HyiRT1XRbEDuVt_ehO88nqLBevMo"
    static let API_KEY = "b7267083305bc71010c161d810acf96e"
}
