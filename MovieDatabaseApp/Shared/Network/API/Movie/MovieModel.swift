//
//  MovieModel.swift
//  MovieDatabaseApp
//
//  Created by Jann Zaplan on 2022-03-13.
//

import Foundation

public class MovieItem {
    open var original_title: String
    open var overview: String
    open var poster_path: String

    public init(original_title: String, overview: String, poster_path: String) {
        self.original_title = original_title
        self.overview = overview
        self.poster_path = poster_path
    }
}
