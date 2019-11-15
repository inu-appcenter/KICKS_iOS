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
    var jibunAddr: String?
    var admCd: String?
    var rnMgtSn: String?
    var bdMgtSn: String?
    var udrtYn: String?
    var buldMnnm: String?
    var buldSlno: String?
    
    init(roadAddr: String, jibunAddr: String, admCd: String, rnMgtSn: String, bdMgtSn: String, udrtYn: String, buldMnnm: String, buldSlno: String) {
        self.roadAddr = roadAddr
        self.jibunAddr = jibunAddr
        self.admCd = admCd
        self.rnMgtSn = rnMgtSn
        self.bdMgtSn = bdMgtSn
        self.udrtYn = udrtYn
        self.buldMnnm = buldMnnm
        self.buldSlno = buldSlno
    }
}

class LatLon{
    var lat: Double?
    var lon: Double?
    
    init(lat: Double, lon: Double) {
        self.lat = lat
        self.lon = lon
    }
}
