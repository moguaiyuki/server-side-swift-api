//
//  Mail.swift
//  api
//
//  Created by 大塚悠貴 on 2019/04/07.
//

import Foundation
import SwiftKueryORM
import SwiftKueryPostgreSQL

struct GMemo: Codable, Equatable {
    var id: Int?
    var content: String?
    var userId: Int?

    static func ==(lhs: GMemo, rhs: GMemo) -> Bool {
        return lhs.id == rhs.id
    }
}

extension GMemo: Model {}
