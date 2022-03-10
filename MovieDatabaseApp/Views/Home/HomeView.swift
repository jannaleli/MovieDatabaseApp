//
//  HomeView.swift
//  MovieDatabaseApp
//
//  Created by Jann Aleli Zaplan on 2022-03-05.
//

import Foundation
import UIKit

protocol HomeViewDelegate: AnyObject {
    func cellSelected()
}

class HomeView: UIView {
    // MARK: - Public Properties

    weak var delegate: HomeViewDelegate?

    // MARK: - Private Properties

    private var sampleData = ["Eenie", "Mini", "Mini", "Mo"]

    private var dataSource: CollectionViewDataSource?

    private var collectionDelegate: CollectionViewDelegate?

    private lazy var collectionView: UICollectionView = makeCollectionView()

    private lazy var titleLabel: UILabel = makeTitleLabel()

    private lazy var stackView: UIStackView = makeStackView()

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        setGeneralConfigurations()
        createSubviews()
        setUpConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setGeneralConfigurations()
        createSubviews()
        setUpConstraints()
    }

    // MARK: - Methods

    private func setGeneralConfigurations() {
        backgroundColor = .white
    }

    private func createSubviews() {
        dataSource = CollectionViewDataSource(dataSrc: sampleData)
        collectionDelegate = CollectionViewDelegate()
        collectionView.dataSource = dataSource
        collectionView.delegate = collectionDelegate
        let collectionViewDelegate = collectionView.delegate as! CollectionViewDelegate
        collectionViewDelegate.delegate = self
        collectionView.register(MovieCell.self, forCellWithReuseIdentifier: MovieCell.identifier)
        collectionView.reloadData()
        addSubview(stackView)
    }

    private func setUpConstraints() {
        // stackView.setSize(width: 400, height: 500)
        // stackView.center(centerX: layoutMarginsGuide.centerXAnchor, centerY: layoutMarginsGuide.centerYAnchor)

        stackView.anchor(top: layoutMarginsGuide.topAnchor,
                         paddingTop: 10,
                         bottom: layoutMarginsGuide.bottomAnchor,
                         paddingBottom: 10,
                         left: layoutMarginsGuide.leadingAnchor,
                         paddingLeft: 5,
                         right: layoutMarginsGuide.trailingAnchor,
                         paddingRight: 2,
                         width: 0,
                         height: 0)
    }

    // MARK: - Actions

    @objc func handleCellTapped() {
        delegate?.cellSelected()
    }
}

// MARK: - Factory

extension HomeView {
    func makeCollectionView() -> UICollectionView {
        let viewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.backgroundColor = .white
        return collectionView
    }

    func makeStackView() -> UIStackView {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20.0
        stack.alignment = .fill
        stack.distribution = .fill
        [titleLabel,
         collectionView].forEach { stack.addArrangedSubview($0) }
        return stack
    }

    func makeTitleLabel() -> UILabel {
        let titleLabel = UILabel()
        titleLabel.textColor = .systemBlue
        let attributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.kern: 2]
        titleLabel.attributedText = NSAttributedString(string: "Movie Database \u{1F3A5}", attributes: attributes)
        titleLabel.textAlignment = .center

        titleLabel.font = UIFont(name: "Helvetica Neue", size: 30)

        return titleLabel
    }
}

extension HomeView: CollectionViewDelegateProtocol {
    func cellSelected() {
        delegate?.cellSelected()
    }
}
