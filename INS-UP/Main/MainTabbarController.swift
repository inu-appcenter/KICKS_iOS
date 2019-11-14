//
//  MainTabbarController.swift
//  INS-UP
//
//  Created by Cho on 14/11/2019.
//  Copyright © 2019 Cho. All rights reserved.
//

import UIKit

class MainTabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupVisualDesigns()
        // Do any additional setup after loading the view.
    }
    

    func setupVisualDesigns() {
        tabBar.layer.borderWidth = 0.3
        tabBar.layer.borderColor = UIColor.InsUpColor.gray.cgColor
        tabBar.clipsToBounds = true
        tabBar.barTintColor = .white
        tabBar.unselectedItemTintColor = UIColor.init(ored: 161, ogreen: 161, oblue: 161, alpha: 1)
        tabBar.tintColor = UIColor.InsUpColor.black
        
        tabBar.itemPositioning = .centered
        
        tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.MGothic(type: .sb, size: 10, isFix: true)], for: .normal)
        tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.MGothic(type: .sb, size: 10, isFix: true)], for: .selected)
    }
}
