//
//  UserDetailViewModel.swift
//  SevenAppTask
//
//  Created by Cengizhan Dumlu on 29.01.2025.
//

import Foundation

class UserDetailViewModel {
    let user: User

    init(user: User) {
        self.user = user
    }

    var name: String { user.name }
    var email: String { "📧 \(user.email)" }
    var phone: String { "📞 \(user.phone)" }
    var website: String { "🌐 \(user.website)" }
}
