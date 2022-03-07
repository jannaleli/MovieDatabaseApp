//
//  MainView.swift
//  MovieDatabaseApp
//
//  Created by Jann Aleli Zaplan on 2022-03-05.
//

import Foundation
import UIKit

class MainView: UIView {
    var delegate: MainViewControllerDelegate?
    var table: UITableView = UITableView()
    var sampleData = ["Eenie", "Mini", "Mo"]
    var dataSource: TableDataSource?
    var tableDelegate: TableViewDelegate?
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20.0
        stack.alignment = .fill
        stack.distribution = .fillEqually
        [self.table].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    
    
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
    
    func setGeneralConfigurations() {
        backgroundColor = .white
    }
    
    func createSubviews() {
        


        dataSource = TableDataSource(dataSrc: sampleData)
        tableDelegate = TableViewDelegate()
        //self.table.dataSource = TableDataSource(dataSrc: sampleData)
        //This will generate a warning that your dataSource is weak and thus will be deallocated and your table will never load
        self.table.dataSource = dataSource
        self.table.delegate = tableDelegate
        
        table.register(UITableViewCell.classForKeyedArchiver(), forCellReuseIdentifier: "Cell")
        addSubview(stackView)
    }
    
    func setUpConstraints() {
        
        stackView.setSize(width: 400, height: 200)
        stackView.center(centerX: layoutMarginsGuide.centerXAnchor, centerY: layoutMarginsGuide.centerYAnchor)


    }
}


