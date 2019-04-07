//
//  MailRoutes.swift
//  api
//
//  Created by 大塚悠貴 on 2019/04/07.
//

import Foundation

func initializeMailRoutes(app: App) {
    let gMemosController = GMemosController()
    app.router.post("/mails/", handler: gMemosController.sendHandler)
}
