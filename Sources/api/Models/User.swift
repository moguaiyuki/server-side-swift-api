//
//  User.swift
//  api
//
//  Created by 大塚悠貴 on 2019/04/07.
//

import Foundation
import SwiftKueryORM
import SwiftKueryPostgreSQL

struct User: Codable, Equatable {
    var id: Int?
    var user_id: String?
    var password: String?

    static func ==(lhs: User, rhs: User) -> Bool {
        return (lhs.id == rhs.id) && (lhs.user_id == rhs.user_id)
    }
}

extension User: Model {}
