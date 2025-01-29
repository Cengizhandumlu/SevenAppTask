//
//  UserRepository.swift
//  SevenAppTask
//
//  Created by Cengizhan Dumlu on 29.01.2025.
//

import Foundation

//Kullanıcı verilerinin alınmasını sağlayacak protokol.
protocol UserRepositoryProtocol {
    
    //Asenkron olarak kullanıcı verilerinin döndürüldüğü bir fonksiyon
    func fetchUsers() async throws -> [User]
}

class UserRepository: UserRepositoryProtocol {
    //Network işlemleri için gerekli olan servis.
    private let networkService: NetworkService
    
    //Dependecy injection yönetimiyle network servisi sınıfa aktarıldı ve default değer olarak singleton örneği kullanıldı.
    init(networkService: NetworkService = .shared) {
        self.networkService = networkService
    }
    
    //Asenkron şekilde kullanıcı verisinin çekildiği fonksiyon.
    func fetchUsers() async throws -> [User] {
           return try await networkService.fetchUsers()
    }
}
