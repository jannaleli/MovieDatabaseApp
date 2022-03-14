//
//  MovieModel.swift
//  MovieDatabaseApp
//
//  Created by Jann Zaplan on 2022-03-13.
//

import Foundation

struct MovieItem: Codable {
    let original_title: String
    let overview: String
    let poster_path: String
}
