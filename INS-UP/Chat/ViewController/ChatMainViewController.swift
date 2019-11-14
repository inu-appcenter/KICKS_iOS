//
//  ChatMainViewController.swift
//  INS-UP
//
//  Created by Cho on 09/11/2019.
//  Copyright © 2019 Cho. All rights reserved.
//

import UIKit

class ChatMainViewController: UIViewController {
        
    @IBAction func gotoNext(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ChatRoom") as! ChatRoomViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "메세지"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        if #available(iOS 13.0, *) {
            return .darkContent
        } else {
            return .default
        }
    }
    
}
