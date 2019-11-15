//
//  ColorExtension.swift
//  INS-UP
//
//  Created by Cho on 10/11/2019.
//  Copyright © 2019 Cho. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience init(ored: CGFloat, ogreen: CGFloat, oblue: CGFloat, alpha: CGFloat) {
        self.init(red: ored / 255,
        green: ogreen / 255,
        blue: oblue / 255,
        alpha: alpha)
    }
    
    struct InsUpColor {
        static let black: UIColor = UIColor.init(ored: 51, ogreen: 51, oblue: 51, alpha: 1)
        
        static let gray: UIColor = UIColor.init(ored: 191, ogreen: 191, oblue: 191, alpha: 1)
        
        static let lightgray: UIColor = UIColor.init(ored: 242, ogreen: 242, oblue: 242, alpha: 1)
        
        static let darkGrey: UIColor = UIColor.init(ored: 51, ogreen: 51, oblue: 51, alpha: 1)
        
        static let red: UIColor = UIColor.init(ored: 255, ogreen: 63, oblue: 61, alpha: 1)
    }
    
    static var random: UIColor {
        return UIColor(red: .random(in: 0.2...0.7),
                       green: .random(in: 0.2...0.7),
                       blue: .random(in: 0.2...0.7),
                       alpha: 1.0)
    }
    
}
