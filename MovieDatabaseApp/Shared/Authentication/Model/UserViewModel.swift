//
//  UserViewModel.swift
//  MovieDatabaseApp
//
//  Created by Jann Zaplan on 2022-03-22.
//

import Foundation
class UserViewModel: Codable {
    private let user: UserItem

    public init(user: UserItem) {
        self.user = user
    }


}
