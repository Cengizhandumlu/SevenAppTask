//
//  UserListViewModel.swift
//  SevenAppTask
//
//  Created by Cengizhan Dumlu on 29.01.2025.
//

import Foundation

class UserListViewModel {
    
    private let repository: UserRepositoryProtocol
    var users: [User] = []
    var onUsersUpdated: (() -> Void)?
    var onError: ((String) -> Void)?
    
    init(repository: UserRepositoryProtocol = UserRepository()) {
        self.repository = repository
    }
    
    func fetchUsers() {
        Task {
            do {
                users = try await repository.fetchUsers()
                onUsersUpdated?()
            } catch let error as NetworkError {
                onError?(error.localizedDescription)
            } catch {
                onError?("An unexpected error occurred.")
            }
        }
    }
}
