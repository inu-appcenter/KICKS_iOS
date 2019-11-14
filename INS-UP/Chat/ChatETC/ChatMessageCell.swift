//
//  ChatMessageCell.swift
//  INS-UP
//
//  Created by Cho on 10/11/2019.
//  Copyright © 2019 Cho. All rights reserved.
//

import UIKit

class ChatMessageCell: UITableViewCell {
    
    let messageLabel = UILabel()
    let bubbleBackgroundView = UIView()
    
    var chatMessage: ChatMessage! {
        didSet {
            messageLabel.text = chatMessage.text
            if chatMessage.type == .incoming {
                bubbleBackgroundView.backgroundColor = UIColor.InsUpColor.red
                messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32).isActive = true
                messageLabel.textColor = .white
            } else {
                bubbleBackgroundView.backgroundColor = .white
                messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32).isActive = true
                messageLabel.textColor = .black
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupVisualDesign()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupVisualDesign() {
        backgroundColor = .clear
        
        messageLabel.numberOfLines = 0
        messageLabel.font = UIFont.MGothic(type: .m, size: 12)
        bubbleBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(bubbleBackgroundView)
        
        addSubview(messageLabel)
        
        let constraints = [
            messageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            messageLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 250),
            
            bubbleBackgroundView.topAnchor.constraint(equalTo: messageLabel.topAnchor, constant: -10),
            bubbleBackgroundView.leadingAnchor.constraint(equalTo: messageLabel.leadingAnchor, constant: -10),
            bubbleBackgroundView.bottomAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 10),
            bubbleBackgroundView.trailingAnchor.constraint(equalTo: messageLabel.trailingAnchor, constant: 10)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
}
