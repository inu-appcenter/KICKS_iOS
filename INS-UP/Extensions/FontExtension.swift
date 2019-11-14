//
//  FontExtension.swift
//  INS-UP
//
//  Created by Cho on 14/11/2019.
//  Copyright © 2019 Cho. All rights reserved.
//

import UIKit

enum MGothicType: String {
    case l = "OTMGothicL"
    case r = "OTMGothicR"
    case m = "OTMGothicM"
    case sb = "OTMGothicSB"
}

extension UIFont {
    
    private static func getFontSize(_ size: CGFloat, isFix: Bool) -> CGFloat {
        if isFix {
            return size
        }
        
        guard let width = UIApplication.shared.keyWindow?.frame.width else {
            return size
        }
        
        return size * (width / 375)
    }
    
    static func MGothic(type: MGothicType, size: CGFloat, isFix: Bool = false) -> UIFont {
        guard let font = UIFont.init(name: type.rawValue, size: getFontSize(size, isFix: isFix)) else {
            let sFont = UIFont.systemFont(ofSize: getFontSize(size, isFix: isFix))
            return sFont
        }
        return font
    }
    
}
