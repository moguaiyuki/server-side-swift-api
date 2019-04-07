//
//  Application.swift
//  api
//
//  Created by 大塚悠貴 on 2019/04/07.
//

import Foundation
import Kitura
import LoggerAPI
import KituraOpenAPI
import SwiftKueryORM
import SwiftKueryPostgreSQL
import Dispatch

public class App {

    // MARK:- Property

    let router = Router()

    // MARK: - Public

    func run() throws {
        try postInit()
        Kitura.addHTTPServer(onPort: 8080, with: router)
        Kitura.run()
    }

    // MARK: - Private

    private func postInit() throws {
        initilazeUserRoutes(app: self)
        Persistence.setUp()
        do {
            try User.createTableSync()
        } catch let error {
            print("Table Already exists. Error: \(String(describing: error))")
        }
        KituraOpenAPI.addEndpoints(to: router)
    }
}

final class Persistence {
    static func setUp() {
        let pool = PostgreSQLConnection.createPool(host: "localhost", port: 5432, options: [.databaseName("userdb")], poolOptions: ConnectionPoolOptions(initialCapacity: 10, maxCapacity: 50))
        Database.default = Database(pool)
    }
}
