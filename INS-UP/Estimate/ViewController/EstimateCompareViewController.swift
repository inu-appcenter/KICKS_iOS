//
//  EstimateCompareViewController.swift
//  INS-UP
//
//  Created by Cho on 16/11/2019.
//  Copyright © 2019 Cho. All rights reserved.
//

import UIKit

class EstimateCompareViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleContainerView: UIView!
    @IBOutlet weak var chartButton: UIButton!
    
    @IBAction func backTapped(_ sender: Any) {
        if chartButton.isSelected {
            chartButton.isSelected = false
            chartButton.sizeToFit()
            titleLabel.text = "받은 견적 비교"
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func chartTapped(_ sender: Any) {
        if !chartButton.isSelected {
            chartButton.isSelected = true
            chartButton.sizeToFit()
            titleLabel.text = "차트 비교"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setVisualDesigns()
        // Do any additional setup after loading the view.
    }

}

extension EstimateCompareViewController {
    
    func setVisualDesigns() {
        self.view.backgroundColor = .white
        setTitleViewLabel()
        setButton()
    }
    
    func setTitleViewLabel() {
        titleContainerView.backgroundColor = .white
        titleLabel.textColor = UIColor.InsUpColor.black
        titleLabel.text = "받은 견적 비교"
        titleLabel.font = .MGothic(type: .m, size: 16, isFix: true)
    }
    
    func setButton() {
        chartButton.setTitleColor(UIColor.InsUpColor.darkGrey, for: .normal)
        chartButton.setTitleColor(UIColor.InsUpColor.darkGrey, for: .selected)
        chartButton.tintColor = UIColor.InsUpColor.darkGrey
        chartButton.titleLabel?.font = .MGothic(type: .sb, size: 11)
        chartButton.sizeToFit()
    }
}
