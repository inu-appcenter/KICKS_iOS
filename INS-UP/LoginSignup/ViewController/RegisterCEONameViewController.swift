//
//  RegisterCEONameViewController.swift
//  InsUp
//
//  Created by 김성은 on 12/11/2019.
//  Copyright © 2019 김성은. All rights reserved.
//

import UIKit

class RegisterCEONameViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ceoNameTextField: UITextField!
    
    @IBOutlet weak var nextButton: UIButton!
    
    lazy var tapGesture: UITapGestureRecognizer = {
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapped(_:)))
        return tap
    }()
    
    @IBAction func nextButtonClicked(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "RegisterPhoneNumberViewController") as? RegisterPhoneNumberViewController else { return }
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
        ceoNameTextField.font = UIFont.MGothic(type: .r, size: 20)
        ceoNameTextField.text = ""
        nextButton.layer.cornerRadius = 22
        nextButton.titleLabel?.font = UIFont.MGothic(type: .m, size: 14)
        ceoNameTextField.delegate = self
        
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
