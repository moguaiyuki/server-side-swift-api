//
//  UserRoutes.swift
//  api
//
//  Created by 大塚悠貴 on 2019/04/07.
//

import Foundation

func initilazeUserRoutes(app: App) {
    let usersController = UsersController()
    
    app.router.get("/users/", handler: usersController.getAllHandler)
    app.router.get("/users/", handler: usersController.getOneHandler)
    app.router.post("/users/", handler: usersController.storeHandler)
    app.router.delete("/users/", handler: usersController.deleteAllHandler)
    app.router.delete("/users/", handler: usersController.deleteOneHandler)
    app.router.patch("/users/", handler: usersController.updateHandler)
}
