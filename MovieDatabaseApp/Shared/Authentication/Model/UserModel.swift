//
//  UserModel.swift
//  MovieDatabaseApp
//
//  Created by Jann Zaplan on 2022-03-22.
//

import Combine
import Foundation

struct UserItem: Codable, Hashable {
    let username: String
    let password: String
    
    init(username: String, password: String) {
        self.username = username
        self.password = password
    }
}
