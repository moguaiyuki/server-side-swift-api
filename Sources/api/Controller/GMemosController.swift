//
//  GMemosControlelr.swift
//  api
//
//  Created by 大塚悠貴 on 2019/04/07.
//

import Foundation
import Kitura
import SwiftSMTP

final class GMemosController {

    private var nextId: Int = 0

    func sendHandler(gMemo: GMemo, completion: @escaping (GMemo?, RequestError?) -> Void) {
        guard let userId = gMemo.userId else { return completion(nil, .notFound) }
        var gMemo = gMemo

        User.find(id: userId) { user, error in
            if error != nil {
                return completion(nil, .notFound)
            }

            guard let user = user,
                let userEmail = user.email,
                let userName = user.userName,
                let content = gMemo.content else {
                    return completion(nil, .notFound)
            }

            let smtp = SMTP(hostname: "smtp.gmail.com", email: "メールアドレス", password: "パスワード")
            let from = Mail.User(name: "Service Name", email: "メールアドレス")
            let to = Mail.User(name: userName, email: userEmail)

            let mail = Mail(from: from, to: [to], subject: "GMemo", text: content)

            smtp.send(mail) { error in
                if let error = error {
                    print(error)
                }
            }

        }
        gMemo.id = self.nextId
        self.nextId += 1
        gMemo.save(completion)
    }

}
