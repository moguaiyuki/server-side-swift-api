//
//  UserRoutes.swift
//  api
//
//  Created by 大塚悠貴 on 2019/04/07.
//

import Foundation

func initilazeUserRoutes(app: App) {
    let userController = UserController()
    
    app.router.get("/users/", handler: userController.getAllHandler)
    app.router.get("/users/", handler: userController.getOneHandler)
    app.router.post("/users/", handler: userController.storeHandler)
    app.router.delete("/users/", handler: userController.deleteAllHandler)
    app.router.delete("/users/", handler: userController.deleteOneHandler)
    app.router.patch("/users/", handler: userController.updateHandler)
}
