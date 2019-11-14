//
//  SocketIOManager.swift
//  INS-UP
//
//  Created by Cho on 08/11/2019.
//  Copyright © 2019 Cho. All rights reserved.
//

import UIKit
import SocketIO

class SocketIOManager {
    static let sharedManager = SocketIOManager()
    
    private var manager: SocketManager?
    private var socket: SocketIOClient?
    
    private let BASE_URL = "http://18.220.127.100:7000"
    private let roomName = "privateRoom"
    
    private init() {
        if let url = URL(string: BASE_URL) {
            print("socket url : \(url)")
            manager = SocketManager(socketURL: url)
            socket = manager?.defaultSocket
        }
    }
    
    func establishConnection() {
        // 소켓 연결
        socket?.on(clientEvent: .connect, callback: { (_, _) in
            print("connected")
        })
        socket?.on(clientEvent: .disconnect, callback: { (_, _) in
            print("disconneced")
        })
        if socket?.status == .connected {
            print("connected")
        } else {
            socket?.connect()
        }
    }
    
    func closeConnection() {
        socket?.disconnect()
        socket?.removeAllHandlers()
    }
    
    func joinRoom(userName: String) {
        socket?.emit("joinRoom", with: ["test", userName])
    }
    
    func sendMessage(userName: String, message: String) {
        socket?.emit("message", with: ["test", userName, message])
    }
    
    func getMessage(complitionHandler: @escaping (_ messageInfo: [Any]) -> Void) {
        socket?.on("chat message", callback: { (dataArray, _) in
            print(dataArray)
            complitionHandler(dataArray)
        })
    }
}
