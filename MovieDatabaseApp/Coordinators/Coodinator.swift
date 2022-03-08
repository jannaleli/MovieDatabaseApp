//
//  Coodinator.swift
//  MovieDatabaseApp
//
//  Created by Jann Aleli Zaplan on 2022-03-05.
//

import Foundation
import UIKit

public protocol Coordinator: AnyObject {
    // MARK: Declaration of base protocol properties

    var childCoordinators: [Coordinator] { get set }

    // MARK: Declaration of base protocol methods

    func start()
}
