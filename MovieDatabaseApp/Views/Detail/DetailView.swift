//
//  DetailView.swift
//  MovieDatabaseApp
//
//  Created by Jann Zaplan on 2022-03-10.
//

import Foundation
import UIKit

public protocol DetailViewDelegate: AnyObject {
    func goToHomeView()
}

class DetailView: UIView {
    // MARK: - Public Properties

    weak var delegate: DetailViewDelegate?

    // MARK: - Private Properties

    private lazy var titleLabel: UILabel = makeTitleLabel()

    private lazy var stackView: UIStackView = makeStackView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setGeneralConfiguration()
        createSubviews()
        setUpConstraints()
    }

    // MARK: - Initialization

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setGeneralConfiguration()
        createSubviews()
        setUpConstraints()
    }

    // MARK: - Private Methods

    private func setGeneralConfiguration() {}

    private func createSubviews() {
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeRight.direction = .right
        addGestureRecognizer(swipeRight)
        addSubview(stackView)
    }

    private func setUpConstraints() {
        stackView.center(centerX: layoutMarginsGuide.centerXAnchor, centerY: layoutMarginsGuide.centerYAnchor)
        stackView.setSize(width: 400, height: 150)
        stackView.anchor(top: nil,
                         paddingTop: 10,
                         bottom: nil,
                         paddingBottom: 10,
                         left: layoutMarginsGuide.leadingAnchor,
                         paddingLeft: 10,
                         right: layoutMarginsGuide.trailingAnchor,
                         paddingRight: 10,
                         width: 0,
                         height: 0)
    }

    // MARK: - Swipe Gesture Handler

    @objc func respondToSwipeGesture() {
        print("Swiped!!")
        delegate?.goToHomeView()
    }
}

// MARK: - Factory

extension DetailView {
    func makeTitleLabel() -> UILabel {
        let titleLabel = UILabel()
        titleLabel.textColor = .systemBlue
        let attributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.kern: 2]
        titleLabel.attributedText = NSAttributedString(string: "Movie Database \u{1F3A5}", attributes: attributes)
        titleLabel.textAlignment = .center

        titleLabel.font = UIFont(name: "Helvetica Neue", size: 30)

        return titleLabel
    }

    func makeStackView() -> UIStackView {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20.0
        stack.alignment = .fill
        stack.distribution = .fill
        [titleLabel].forEach { stack.addArrangedSubview($0) }
        return stack
    }
}
