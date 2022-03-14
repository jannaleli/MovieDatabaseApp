//
//  CollectionViewDataSource.swift
//  MovieDatabaseApp
//
//  Created by Jann Zaplan on 2022-03-09.
//

import Foundation
import UIKit

final class CollectionViewDataSource: NSObject, UICollectionViewDataSource {
    var objects = [HomeViewModel]()

    init(dataSrc: [HomeViewModel]) {
        objects = dataSrc
    }

    func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        print(objects.count)
        return objects.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCell.identifier, for: indexPath) as! MovieCell

        let movie = objects[indexPath.row]
        print(movie)
        cell.setup(with: movie.originalTitle, and: movie.posterImageUrl)
        cell.contentView.backgroundColor = .red

        return cell
    }
}
