//
//  UserRepository.swift
//  SevenAppTask
//
//  Created by Cengizhan Dumlu on 29.01.2025.
//

import Foundation

protocol UserRepositoryProtocol {
    func fetchUsers() async throws -> [User]
}

class UserRepository: UserRepositoryProtocol {
    private let networkService: NetworkService

    init(networkService: NetworkService = .shared) {
        self.networkService = networkService
    }

    func fetchUsers() async throws -> [User] {
           return try await networkService.fetchUsers()
    }
}
