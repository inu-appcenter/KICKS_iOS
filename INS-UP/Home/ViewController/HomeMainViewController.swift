//
//  HomeMainViewController.swift
//  INS-UP
//
//  Created by Cho on 14/11/2019.
//  Copyright © 2019 Cho. All rights reserved.
//

import UIKit

class HomeMainViewController: UIViewController {

    @IBOutlet weak var topContainerView: UIView!
    @IBOutlet weak var companyNameLabel: UILabel!
    
    @IBOutlet weak var titleLabelOne: UILabel!
    @IBOutlet weak var titleLabelTwo: UILabel!
    
    @IBOutlet weak var searchTextField: UITextField!
    
    @IBOutlet weak var makingButton: UIButton!
    @IBOutlet weak var printingButton: UIButton!
    @IBOutlet weak var nonMetalButton: UIButton!
    @IBOutlet weak var metalButton: UIButton!
    @IBOutlet weak var silkButton: UIButton!
    @IBOutlet weak var etcButton: UIButton!
    
    lazy var tapGesture: UITapGestureRecognizer = {
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapped(_:)))
        return tap
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setVisualDesigns()
        addNoti()
        // Do any additional setup after loading the view.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        if #available(iOS 13.0, *) {
            return .darkContent
        } else {
            return .default
        }
    }

}

//MARK: Visual Initializers

extension HomeMainViewController {
    
    func setVisualDesigns() {
        view.backgroundColor = .white
        setTopView()
        setTitleLabel()
        setSearchTextField()
    }
    
    func setTopView() {
        topContainerView.backgroundColor = .white
        topContainerView.layer.addBorder([.bottom], color: UIColor.InsUpColor.gray, width: 0.5)
        
        companyNameLabel.font = UIFont.MGothic(type: .m, size: 16)
        companyNameLabel.textColor = UIColor.InsUpColor.black
        companyNameLabel.text = "인천시 연수구 컨벤시아대로 42"
    }
    
    func setTitleLabel() {
        titleLabelOne.text = "대표님!"
        titleLabelOne.font = UIFont.MGothic(type: .sb, size: 22)
        titleLabelOne.textColor = UIColor.InsUpColor.black
        
        titleLabelTwo.text = "어떤 업체를 찾으시나요?"
        titleLabelTwo.font = UIFont.MGothic(type: .sb, size: 22)
        titleLabelTwo.textColor = UIColor.InsUpColor.black
    }
    
    func setSearchTextField() {
        searchTextField.backgroundColor = UIColor.init(ored: 237, ogreen: 237, oblue: 237, alpha: 1)
        searchTextField.layer.cornerRadius = 22.5
        
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: 45, height: 45))
        image.image = UIImage(named: "ic_search")
        image.contentMode = .center
        
        searchTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 45, height: 0))
        searchTextField.leftViewMode = .always
        
        searchTextField.addSubview(image)
        
        searchTextField.tintColor = UIColor.InsUpColor.red
        
        searchTextField.font = UIFont.MGothic(type: .r, size: 16, isFix: true)
        searchTextField.textColor = .black
        
        searchTextField.returnKeyType = .search
    }
    
}

//MARK: KeyboardFunctions

extension HomeMainViewController {
    
    func addNoti() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        
    }
    
    @objc func tapped(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
        self.view.removeGestureRecognizer(tapGesture)
    }
    
}
