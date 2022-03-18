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

private enum LayoutConstant {
    static let spacing: CGFloat = 16.0
    static let itemHeight: CGFloat = 300.0
}

final class HomeView: UIView {
    static let sectionHeaderElementKind = "section-header-element-kind"

    // MARK: - Value Types

    typealias DataSource = UICollectionViewDiffableDataSource<Section, MovieItemCellViewModel>

    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, MovieItemCellViewModel>

    // MARK: - Public Properties

    weak var delegate: HomeViewDelegate?

    // MARK: - Private Properties

    private var popularMovies: [MovieItemCellViewModel] = []

    private var upcomingMovies: [MovieItemCellViewModel] = []

    private lazy var collectionView: UICollectionView = makeCollectionView()

    private lazy var titleLabel: UILabel = makeTitleLabel()

    private lazy var stackView: UIStackView = makeStackView()

    private var sections = Section.allSections

    private lazy var dataSource = makeDataSource()

    // MARK: - Functions

    func makeDataSource() -> DataSource {
        // 1
        let dataSource = DataSource(
            collectionView: collectionView,
            cellProvider: { collectionView, indexPath, movie ->
                UICollectionViewCell? in
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCell.identifier, for: indexPath) as! MovieCell

                let movie = movie
                print(movie)
                cell.setup(with: movie.originalTitle, and: movie.posterImageUrl)

                return cell
            }
        )
//        dataSource.supplementaryViewProvider = { collectionView, kind, indexPath in
//            guard kind == UICollectionView.elementKindSectionHeader else {
//                return nil
//            }
//            let section = self.dataSource.snapshot()
//                .sectionIdentifiers[indexPath.section]
//            let view = collectionView.dequeueReusableSupplementaryView(
//                ofKind: kind,
//                withReuseIdentifier: SectionHeaderReusableView.reuseIdentifier,
//                for: indexPath
//            ) as? SectionHeaderReusableView
//            view?.titleLabel.text = section.title
//            return view
//        }
        return dataSource
    }

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        setGeneralConfigurations()
        createSubviews()
        setUpConstraints()
        applySnapshot()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setGeneralConfigurations()
        createSubviews()
        setUpConstraints()
        applySnapshot()
    }

    // MARK: - Methods

    // TODO: Can be renamed to bind
    func configure(with popularMovies: [MovieItemCellViewModel], and upcomingMovies: [MovieItemCellViewModel]) {
        self.popularMovies = popularMovies
        self.upcomingMovies = upcomingMovies
        createSubviews()
        applySnapshot()
    }

    private func setGeneralConfigurations() {
        backgroundColor = .white
    }

    private func createSubviews() {
        collectionView.delegate = self
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

    // 1
    func applySnapshot(animatingDifferences: Bool = true) {
        // 2

        let snapshot = generateSnapshot()
        dataSource.apply(snapshot, animatingDifferences: animatingDifferences)
    }
}

// MARK: - Factory

extension HomeView {
    private func generateSnapshot() -> Snapshot {
        var snapshot = Snapshot()
        snapshot.appendSections([Section(title: "Popular Movies")])
        snapshot.appendItems(popularMovies)

        snapshot.appendSections([Section(title: "Popular TV Show")])
        snapshot.appendItems(upcomingMovies)
        // 4

        return snapshot
    }

    func makeCollectionView() -> UICollectionView {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: generateLayout())
        collectionView.backgroundColor = .white
        return collectionView
    }

    func makeStackView() -> UIStackView {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20.0
        stack.alignment = .fill
        stack.distribution = .fill
        [
            collectionView,
        ].forEach { stack.addArrangedSubview($0) }
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

    func generateLayout() -> UICollectionViewLayout {
        // 1
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

//        item.contentInsets = NSDirectionalEdgeInsets(
//            top: 2,
//            leading: 2,
//            bottom: 2,
//            trailing: 2
//        )
        // 2
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.95),
            heightDimension: .fractionalWidth(1.0)
        )

        let firstGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitem: item,
            count: 2
        )

        let section = NSCollectionLayoutSection(group: firstGroup)
        section.orthogonalScrollingBehavior = .paging
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }

    func generateMultipleLayout() -> UICollectionViewLayout {
        let layout: UICollectionViewCompositionalLayout
        layout = UICollectionViewCompositionalLayout {
            (sectionIndex: Int,
             layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
                let isWideView = layoutEnvironment.container.effectiveContentSize.width > 500

                let sectionLayoutKind = Section.allSections[sectionIndex]
                switch sectionLayoutKind {
                case Section(title: "Popular Movies"): return self.generatePopularMoviesLayout(isWide: isWideView)
                default: return nil
                }
        }

        return layout
    }

    func generateAltLayout() -> UICollectionViewLayout {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.95))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15)
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .paging

        return UICollectionViewCompositionalLayout(section: section)
    }

    func generatePopularMoviesLayout(isWide: Bool) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalWidth(2 / 3))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        // Show one item plus peek on narrow screens, two items plus peek on wider screens
        let groupFractionalWidth = isWide ? 0.475 : 0.95
        let groupFractionalHeight: Float = isWide ? 1 / 3 : 2 / 3
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(CGFloat(groupFractionalWidth)),
            heightDimension: .fractionalWidth(CGFloat(groupFractionalHeight))
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
        group.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)

        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                heightDimension: .estimated(44))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: HomeView.sectionHeaderElementKind, alignment: .top
        )

        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [sectionHeader]
        section.orthogonalScrollingBehavior = .groupPaging

        return section
    }
}

extension HomeView: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, sizeForItemAt _: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 100)
    }

    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, insetForSectionAt _: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: LayoutConstant.spacing, left: LayoutConstant.spacing, bottom: LayoutConstant.spacing, right: LayoutConstant.spacing)
    }

    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, minimumLineSpacingForSectionAt _: Int) -> CGFloat {
        return LayoutConstant.spacing
    }

    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, minimumInteritemSpacingForSectionAt _: Int) -> CGFloat {
        return LayoutConstant.spacing
    }

    func collectionView(_: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.cellSelected()
        guard let movie = dataSource.itemIdentifier(for: indexPath) else {
            return
        }
    }
}
