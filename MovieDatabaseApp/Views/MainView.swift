//
//  MainView.swift
//  MovieDatabaseApp
//
//  Created by Jann Aleli Zaplan on 2022-03-05.
//

import Foundation
import UIKit

class MainView: UIView {
    // MARK: - Public Properties

    weak var delegate: MainViewControllerDelegate?

    // MARK: - Private Properties

    private var sampleData = ["Eenie", "Mini", "Mini", "Mo"]
    private var dataSource: TableDataSource?
    private var tableDelegate: TableViewDelegate?

    private var table: UITableView = .init()

    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textColor = .systemBlue
        let attributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.kern: 2]
        titleLabel.attributedText = NSAttributedString(string: "Movie Database \u{1F3A5}", attributes: attributes)
        titleLabel.textAlignment = .center

        titleLabel.font = UIFont(name: "Helvetica Neue", size: 30)

        return titleLabel
    }()

    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20.0
        stack.alignment = .fill
        stack.distribution = .fill
        [self.titleLabel,
         self.table].forEach { stack.addArrangedSubview($0) }
        return stack
    }()

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
        dataSource = TableDataSource(dataSrc: sampleData)
        tableDelegate = TableViewDelegate()
        // self.table.dataSource = TableDataSource(dataSrc: sampleData)
        // This will generate a warning that your dataSource is weak and thus will be deallocated and your table will never load
        table.dataSource = dataSource
        table.delegate = tableDelegate

        table.register(UITableViewCell.classForKeyedArchiver(), forCellReuseIdentifier: "Cell")
        addSubview(stackView)
    }

    private func setUpConstraints() {
        stackView.setSize(width: 400, height: 500)
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
}
