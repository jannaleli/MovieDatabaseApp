//
//  MovieModel.swift
//  MovieDatabaseApp
//
//  Created by Jann Zaplan on 2022-03-13.
//

import Combine
import Foundation
struct MovieItem: Codable, Hashable {
    let original_title: String
    let overview: String
    let poster_path: String
}

struct MovieItemList: Codable {
    var results: [MovieItem]
}
