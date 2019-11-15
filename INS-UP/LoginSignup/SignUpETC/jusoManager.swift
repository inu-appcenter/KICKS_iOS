//
//  jusoManager.swift
//  INS-UP
//
//  Created by 김성은 on 15/11/2019.
//  Copyright © 2019 Cho. All rights reserved.
//

import Foundation

class JusoSearch{
    var roadAddr: String?
    var roadAddrPart1: String?
    var jibunAddr: String?
    
    init(roadAddr: String, roadAddrPart1: String, jibunAddr: String) {
        self.roadAddr = roadAddr
        self.roadAddrPart1 = roadAddrPart1
        self.jibunAddr = jibunAddr
    }
}
