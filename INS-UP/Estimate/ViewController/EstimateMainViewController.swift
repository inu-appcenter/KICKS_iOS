//
//  EstimateMainViewController.swift
//  INS-UP
//
//  Created by Cho on 15/11/2019.
//  Copyright © 2019 Cho. All rights reserved.
//

import UIKit

class EstimateMainViewController: UIViewController {

    @IBOutlet weak var titleContainerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var estimateTableView: UITableView!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        if #available(iOS 13.0, *) {
            return .darkContent
        } else {
            return .default
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setVisualDesigns()
        // Do any additional setup after loading the view.
    }
    
}

//MARK: Visual Initializers
extension EstimateMainViewController {
    
    func setVisualDesigns() {
        self.view.backgroundColor = .white
        setTitleViewLabel()
    }
    
    func setTitleViewLabel() {
        titleContainerView.backgroundColor = .white
        titleLabel.textColor = UIColor.InsUpColor.black
        titleLabel.text = "견적"
        titleLabel.font = .MGothic(type: .m, size: 25, isFix: true)
    }
    
    func setEstimateTableView() {
        estimateTableView.backgroundColor = .white
    }
}
