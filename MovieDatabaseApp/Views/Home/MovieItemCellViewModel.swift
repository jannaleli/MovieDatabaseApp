//
//  HomeViewModel.swift
//  MovieDatabaseApp
//
//  Created by Jann Zaplan on 2022-03-14.
//

import Foundation
import UIKit

class MovieItemCellViewModel: Codable, Hashable {
    private let movie: MovieItem
    var id = UUID()

    func hash(into hasher: inout Hasher) {
        // 2
        hasher.combine(id)
    }

    static func == (lhs: MovieItemCellViewModel, rhs: MovieItemCellViewModel) -> Bool {
        lhs.id == rhs.id
    }

    public init(movie: MovieItem) {
        self.movie = movie
    }

    public var posterImageUrl: String {
        return ["https://image.tmdb.org/t/p/w154", movie.poster_path].joined()
    }

    public var originalTitle: String {
        return movie.original_title
    }
}
