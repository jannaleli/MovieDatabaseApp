//
//  DetailViewController.swift
//  MovieDatabaseApp
//
//  Created by Jann Zaplan on 2022-03-10.
//

import Foundation
import UIKit

public protocol DetailViewControllerDelegate: AnyObject {
    func goToDetailsView()
}

class DetailViewController: UIViewController {
    weak var delegate: DetailViewControllerDelegate?
    var detailView = DetailView()

    override func loadView() {
        detailView.delegate = self
        view = detailView
    }
}

extension DetailViewController: DetailViewDelegate {
    func goToDetailsView() {}
}
