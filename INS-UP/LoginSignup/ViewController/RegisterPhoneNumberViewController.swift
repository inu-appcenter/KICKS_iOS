//
//  RegisterPhoneNumberViewController.swift
//  INS-UP
//
//  Created by 김성은 on 15/11/2019.
//  Copyright © 2019 Cho. All rights reserved.
//

import UIKit

class RegisterPhoneNumberViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var numLabel: UILabel!
    
    @IBOutlet weak var nextButton: UIButton!
    
    lazy var tapGesture: UITapGestureRecognizer = {
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapped(_:)))
        return tap
    }()
    
    @IBAction func nextButtonClicked(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "RegisterCompanyAddressViewController") as? RegisterCompanyAddressViewController else { return }
        self.navigationController?.show(vc, sender: nil)
    }
    
    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        titleLabel.font = UIFont.MGothic(type: .r, size: 20)
        numberTextField.font = UIFont.MGothic(type: .r, size: 20)
        numberTextField.text = ""
        numberTextField.delegate = self
        numberTextField.keyboardType = .numberPad
        numLabel.font = UIFont.MGothic(type: .r, size: 10)
        nextButton.layer.cornerRadius = 22
        nextButton.titleLabel?.font = UIFont.MGothic(type: .m, size: 14)
        
        addNoti()
    }
    

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
