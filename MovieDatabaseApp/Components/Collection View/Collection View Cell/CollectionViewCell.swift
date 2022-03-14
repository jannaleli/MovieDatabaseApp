//
//  CollectionViewCell.swift
//  MovieDatabaseApp
//
//  Created by Jann Zaplan on 2022-03-09.
//

import Foundation
import UIKit

protocol ReusableView: AnyObject {
    static var identifier: String { get }
}

final class MovieCell: UICollectionViewCell {
    let textLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .white
        return label
    }()

    var posterImage: UIImage = .init()
    var posterImageView: UIImageView = .init()

    func setup(with title: String, and poster: String) {
        textLabel.text = title
        let url = "https://image.tmdb.org/t/p/w154\(poster)"
        if let theProfileImageUrl = URL(string: "https://image.tmdb.org/t/p/w154\(poster)") {
            if let imageData = NSData(contentsOf: theProfileImageUrl as URL) {
                posterImage = UIImage(data: (imageData as? Data)!)!
                posterImageView.image = posterImage
            }
        }
    }

    override init(frame _: CGRect) {
        super.init(frame: .zero)
        setupViews()
        setupLayouts()
    }

    private func setupViews() {
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 3

        contentView.addSubview(textLabel)
        contentView.addSubview(posterImageView)
    }

    private func setupLayouts() {
        textLabel.translatesAutoresizingMaskIntoConstraints = false

        // Layout constraints for `profileImageView`
        NSLayoutConstraint.activate([
            textLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            textLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            textLabel.topAnchor.constraint(equalTo: contentView.topAnchor),

        ])

        posterImageView.translatesAutoresizingMaskIntoConstraints = false

        // Layout constraints for `profileImageView`
        NSLayoutConstraint.activate([
            posterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            posterImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            posterImageView.topAnchor.constraint(equalTo: contentView.topAnchor),

        ])
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MovieCell: ReusableView {
    static var identifier: String {
        return String(describing: self)
    }
}
