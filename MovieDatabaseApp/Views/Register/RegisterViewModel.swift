//
//  RegisterViewModel.swift
//  MovieDatabaseApp
//
//  Created by Jann Zaplan on 2022-03-10.
//

import Foundation
import UIKit

final class RegisterViewModel {
    private let firebaseService: DefaultFirebaseServices

    init(firebaseService: DefaultFirebaseServices) {
        self.firebaseService = firebaseService
    }
}
