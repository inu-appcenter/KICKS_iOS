//
//  ChatRoomViewController.swift
//  INS-UP
//
//  Created by Cho on 10/11/2019.
//  Copyright © 2019 Cho. All rights reserved.
//

import UIKit

class ChatRoomViewController: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var messageTextView: UITextView!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var chatTableView: UITableView!
    
    @IBOutlet weak var containerViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var containerViewHeightConstraint: NSLayoutConstraint!
    
    @IBAction func sendMessage(_ sender: Any) {
        if let message = messageTextView.text {
            chatManager.sendMessage(message: message)
            messageTextView.text = ""
        }
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    let chatManager = ChatMananger(userName: "Choy")
    let cellID = "Chat"
        
    lazy var tapGesture: UITapGestureRecognizer = {
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapped(_:)))
        return tap
    }()
    
    var chatMessages: [ChatMessage] = [] {
        didSet {
            DispatchQueue.main.async {
                let indexPath = IndexPath(row: self.chatMessages.count - 1, section: 0)
                self.chatTableView.insertRows(at: [indexPath], with: .automatic)
                self.chatTableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
            }
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        if #available(iOS 13.0, *) {
            return .darkContent
        } else {
            return .default
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chatManager.delegate = self
        chatManager.getMessage()
        chatManager.joinRoom()
        setupVisualDesigns()
        setupChatTableView()
        addNoti()
    }
}

//MARK: VisualInitializer & Setters
extension ChatRoomViewController {
    
    func setupVisualDesigns() {
        setupContainerView()
        self.view.backgroundColor = .white
    }
    
    func setupContainerView() {
        containerView.backgroundColor = .white
        
        messageTextView.layer.cornerRadius = messageTextView.bounds.height / 2
        messageTextView.backgroundColor = UIColor.InsUpColor.lightgray
        messageTextView.contentInset = UIEdgeInsets(top: 2, left: 15, bottom: 2, right: 15)
        messageTextView.tintColor = UIColor.InsUpColor.red
        messageTextView.isScrollEnabled = false
        messageTextView.delegate = self
    }
    
    func setupChatTableView() {
        chatTableView.register(ChatMessageCell.self, forCellReuseIdentifier: cellID)
        chatTableView.dataSource = self
        chatTableView.delegate = self
        chatTableView.backgroundColor = UIColor.InsUpColor.lightgray
        chatTableView.separatorStyle = .none
    }
    
}

extension ChatRoomViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatMessages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! ChatMessageCell
        
        cell.chatMessage = chatMessages[indexPath.row]
        
        cell.bubbleBackgroundView.layer.cornerRadius = cell.frame.height / 4
        return cell
    }
    
}

extension ChatRoomViewController: ChatDelegate {
    
    func messageReceived(message: ChatMessage?) {
        if let msg = message {
            self.chatMessages.append(msg)
        }
    }
    
}

extension ChatRoomViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        messageTextView.sizeToFit()
    }
}

extension ChatRoomViewController {
    
    func addNoti() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardFrame = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let keyboardHeight = keyboardFrame.height - (self.tabBarController?.tabBar.frame.height ?? 0)
            
            containerViewBottomConstraint.constant = -keyboardHeight
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            }
            self.view.addGestureRecognizer(tapGesture)
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        containerViewBottomConstraint.constant = 0
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func tapped(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
        self.view.removeGestureRecognizer(tapGesture)
    }
    
}
