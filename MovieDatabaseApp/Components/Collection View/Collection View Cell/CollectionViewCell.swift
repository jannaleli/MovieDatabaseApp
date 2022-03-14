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

    func setup(with title: String) {
        textLabel.text = title
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
    }

    private func setupLayouts() {
        textLabel.translatesAutoresizingMaskIntoConstraints = false

        // Layout constraints for `profileImageView`
        NSLayoutConstraint.activate([
            textLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            textLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            textLabel.topAnchor.constraint(equalTo: contentView.topAnchor),

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
