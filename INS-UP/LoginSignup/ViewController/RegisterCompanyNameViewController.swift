//
//  RegisterCompanyNameViewController.swift
//  InsUp
//
//  Created by 김성은 on 12/11/2019.
//  Copyright © 2019 김성은. All rights reserved.
//

import UIKit

class RegisterCompanyNameViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var companyNameTextField: UITextField!
    
    @IBOutlet weak var roleLabel: UILabel!
    @IBOutlet weak var selectSegment: UISegmentedControl!
    
    @IBOutlet weak var nextButton: UIButton!
    
    lazy var tapGesture: UITapGestureRecognizer = {
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapped(_:)))
        return tap
    }()
    
    @IBAction func nextButtonClicked(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "RegisterCompanyFieldViewController") as? RegisterCompanyFieldViewController else { return }
        self.navigationController?.show(vc, sender: nil)
    }
    
    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addNoti()
        // Do any additional setup after loading the view.
        
        titleLabel.font = UIFont.MGothic(type: .r, size: 20)
        companyNameTextField.font = UIFont.MGothic(type: .r, size: 20)
        companyNameTextField.text = ""
        companyNameTextField.delegate = self
        nextButton.layer.cornerRadius = 22
        nextButton.titleLabel?.font = UIFont.MGothic(type: .m, size: 14)
        
        roleLabel.text = "회사의 역할을 선택해주세요."
        roleLabel.font = UIFont.MGothic(type: .r, size: 20)
        selectSegment.setTitle("의뢰 기업", forSegmentAt: 0)
        selectSegment.setTitle("제작 기업", forSegmentAt: 1)
        selectSegment.layer.cornerRadius = 22
        selectSegment.layer.borderColor = UIColor.clear.cgColor
        selectSegment.layer.borderWidth = 0.1
        selectSegment.clipsToBounds = true
        if #available(iOS 13.0, *) {
            selectSegment.selectedSegmentTintColor = .white
        } else {
            selectSegment.tintColor = .white
        }
        
        selectSegment.backgroundColor = UIColor.InsUpColor.red
        selectSegment.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.MGothic(type: .sb, size: 15)], for: .normal)
        selectSegment.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.InsUpColor.black, NSAttributedString.Key.font: UIFont.MGothic(type: .sb, size: 15)], for: .selected)
    }

}

extension RegisterCompanyNameViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
    }
    
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
