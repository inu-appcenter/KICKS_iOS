//
//  ChatMananger.swift
//  INS-UP
//
//  Created by Cho on 09/11/2019.
//  Copyright © 2019 Cho. All rights reserved.
//

import Foundation

enum MessageType {
    case incoming
    case outgoing
}

struct ChatMessage {
    let userName: String
    let text: String
    let type: MessageType
}

class ChatMananger {
    let userName: String!
    
    var delegate: ChatDelegate?
    
    init(userName: String) {
        self.userName = userName
    }
    
    func joinRoom() {
        SocketIOManager.sharedManager.joinRoom(userName: userName)
    }
    
    func sendMessage(message: String) {
        SocketIOManager.sharedManager.sendMessage(userName: userName, message: message)
    }
    
    func getMessage() {
        SocketIOManager.sharedManager.getMessage { (messageData) in
            self.delegate?.messageReceived(message: self.divideMessage(messageData: messageData))
        }
    }
    
    private func divideMessage(messageData: [Any]) -> ChatMessage? {
        guard let name = messageData[0] as? String else {
            return nil
        }
        
        guard let message = messageData[1] as? String else {
            return nil
        }
        
        let type: MessageType = name == userName ? .outgoing : .incoming
        let chatMessage = ChatMessage(userName: userName, text: message, type: type)
        
        return chatMessage
    }
}

protocol ChatDelegate {
    func messageReceived(message: ChatMessage?)
}
