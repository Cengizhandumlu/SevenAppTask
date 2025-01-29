//
//  NetworkService.swift
//  SevenAppTask
//
//  Created by Cengizhan Dumlu on 29.01.2025.
//

import Foundation

//Ağ işlemlerinin yönetildiği kısım.
class NetworkService {
    //Singleton tasarım deseni ile tek bir NetworkService kullanıldı.
    static let shared = NetworkService()
    //baseURL API'nin temel url'i.
    private let baseURL = "https://jsonplaceholder.typicode.com"
    
    //API üzerinden kullanıcı verilerinin çekilmesi için oluşturulan asenkron fonksiyon.
    //Asenkron işlemler için daha temiz ve sürdürülebilir bir yapı sunan async/await tercih edilmiştir.
    func fetchUsers() async throws -> [User] {
        //URL oluşturulurken hata almamak için geçerlilik kontrolü sağlandı.
        guard let url = URL(string: "\(baseURL)/users") else {
            throw NetworkError.invalidURL
        }
        //Veri asenkron bir şekilde çekildi.
        let (data, _) = try await URLSession.shared.data(from: url)
        //Çekilen verilerin user modeline dönüştürülmesi için decoding işlemi gerçekleştirildi.
        return try JSONDecoder().decode([User].self, from: data)
    }
}

//Ağ işlemleri ile ilgili olabilecek hataların tanımlandığı bir enum.
enum NetworkError: Error {
    case invalidURL //geçersiz url
    case noData //verinin alınamama durumu.
    case decodingFailed //JSON verisinin çözümlenememesi
}
