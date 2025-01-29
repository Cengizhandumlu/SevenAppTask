//
//  User.swift
//  SevenAppTask
//
//  Created by Cengizhan Dumlu on 29.01.2025.
//

import Foundation

//Kullanıcı modelini temsil eden bir struct oluşturuldu.
struct User: Codable {
    let id: Int
    let name: String
    let email: String
    let phone: String
    let website: String
}
