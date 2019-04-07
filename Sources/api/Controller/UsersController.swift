//
//  UserController.swift
//  api
//
//  Created by 大塚悠貴 on 2019/04/07.
//

import Foundation
import Kitura

final class UsersController {

    // MARK:- Property

    private var nextId = 0

    // MARK: - Public

    func getAllHandler(completion: @escaping ([User]?, RequestError?) -> Void) {
        User.findAll(completion)
    }

    func getOneHandler(id: Int, completion: @escaping (User?, RequestError?) -> Void) {
        User.find(id: id, completion)
    }

    func storeHandler(user: User, completion: @escaping (User?, RequestError?) -> Void ) {
        var user = user
        user.id = nextId
        nextId += 1
        user.save(completion)
    }

    func deleteAllHandler(completion: @escaping (RequestError?) -> Void ) {
        User.deleteAll(completion)
    }

    func deleteOneHandler(id: Int, completion: @escaping (RequestError?) -> Void) {
        User.delete(id: id, completion)
    }

    func updateHandler(id: Int, new: User, completion: @escaping (User?, RequestError?) -> Void ) {
        User.find(id: id) { (preExistingUser, error) in
            if error != nil {
                return completion(nil, .notFound)
            }

            guard var oldUser = preExistingUser else {
                return completion(nil, .notFound)
            }

            guard let id = oldUser.id else {
                return completion(nil, .internalServerError)
            }

            oldUser.userName = new.userName ?? oldUser.userName
            oldUser.password = new.password ?? oldUser.password
            oldUser.email = new.email ?? oldUser.email

            oldUser.update(id: id, completion)
        }
    }
}
