//
//  UserViewModel.swift
//  MovieDatabaseApp
//
//  Created by Jann Zaplan on 2022-03-22.
//

import Combine
import Foundation

class LoginViewModel: ObservableObject {
    let authServices: AuthenticationServiceProtocol
    @Published var isLogin: Bool = false
    @Published var showAlert: Bool = false
    @Published var user = [UserItem]()
    @Published var authLoadingError: String = ""
    private var cancellableSet: Set<AnyCancellable> = []

    init(authServices: AuthenticationServiceProtocol = AuthenticationService()) {
        self.authServices = authServices
    }

    func login(username: String, password: String) {
        authServices.login(username: username, password: password)
            .sink {
                dataResponse in

                guard let data = dataResponse as? [UserItem] else {
                    return
                }
                self.user = dataResponse

            }.store(in: &cancellableSet)
    }

    func createAlert(with error: NetworkError) {
        authLoadingError = error.backendError == nil ? error.initialError.localizedDescription : error.backendError!.message
        showAlert = true
    }
}
