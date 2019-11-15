//
//  UserManager.swift
//  INS-UP
//
//  Created by Cho on 16/11/2019.
//  Copyright © 2019 Cho. All rights reserved.
//

import UIKit

enum UserType {
    case product
    case order
}

class UserManager {
    
    static var manager = UserManager()
    
    private init() {
        
    }
    
    private var userName: String?
    private var userType: UserType?
    
    func setUserType(_ type: UserType) {
        self.userType = type
    }
    
    func setUserName(_ name: String) {
        self.userName = name
    }
    
    func getUserName() -> String? {
        return userName
    }
    
}
