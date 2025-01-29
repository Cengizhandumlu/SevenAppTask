//
//  NetworkService.swift
//  SevenAppTask
//
//  Created by Cengizhan Dumlu on 29.01.2025.
//

import Foundation

class NetworkService {
    static let shared = NetworkService()
    private let baseURL = "https://jsonplaceholder.typicode.com"

    func fetchUsers() async throws -> [User] {
        guard let url = URL(string: "\(baseURL)/users") else {
            throw NetworkError.invalidURL
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([User].self, from: data)
    }
}

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingFailed
}
