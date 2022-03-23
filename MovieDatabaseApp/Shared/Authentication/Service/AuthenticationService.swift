//
//  AuthenticationServices.swift
//  MovieDatabaseApp
//
//  Created by Jann Zaplan on 2022-03-22.
//

import Combine
import Firebase
import Foundation

protocol AuthenticationServiceProtocol {
    func login(username: String, password: String) -> AnyPublisher<User?, Never>
    // func register(username: String, password: String) -> AnyPublisher<User?, Never>
    func observeAuthChanges() -> AnyPublisher<User?, Never>
}

class AuthenticationService: AuthenticationServiceProtocol {
    func login(username: String, password: String) -> AnyPublisher<User?, Never> {
        var cancellable = Set<AnyCancellable>()

        return Future<User?, Never> { promise in

            Auth.auth().signIn(withEmail: username, password: password, completion: {
                result, error in

                if let e = error {
                    // TODO: Place an error completion block in here

                } else if let user = result?.user {
                    return promise(.success(user))
                }

            })
        }.eraseToAnyPublisher()
    }

//    func register(username _: String, password _: String) -> AnyPublisher<User?, Never> {
//        var cancellable = Set<AnyCancellable>()
//        let auth = Auth.auth()
//    }

    func observeAuthChanges() -> AnyPublisher<User?, Never> {
        Publishers.AuthPublisher().eraseToAnyPublisher()
    }
}
