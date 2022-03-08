//
//  BaseFactory.swift
//  MovieDatabaseApp
//
//  Created by Jann Zaplan on 2022-03-07.
//

import Foundation
import UIKit

protocol MainFactory {
    func makeViewController(coordinator: MainCoordinator) -> MainViewController
    /* No ViewModel yet */
    /* func makeViewModel(coordinator: MainCoordinator) -> ViewModel */
}
