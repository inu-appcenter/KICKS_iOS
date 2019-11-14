//
//  LoginMainViewController.swift
//  INS-UP
//
//  Created by Cho on 15/11/2019.
//  Copyright © 2019 Cho. All rights reserved.
//

import UIKit

class LoginMainViewController: UIViewController {
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwdTextField: UITextField!
    
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var findIdPasswdButton: UIButton!
    
    @IBOutlet weak var loginButton: UIButton!
    
    lazy var tapGesture: UITapGestureRecognizer = {
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapped(_:)))
        return tap
    }()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        if #available(iOS 13.0, *) {
            return .lightContent
        } else {
            return .lightContent
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setVisualDesign()
        addNoti()
        // Do any additional setup after loading the view.
    }

}

//MARK: Visual Initializers

extension LoginMainViewController {
    
    func setVisualDesign() {
        setTextFields()
        setButtons()
    }
    
    func setTextFields() {
        let textFields: [UITextField] = [idTextField, passwdTextField]
        
        for textField in textFields {
            textField.backgroundColor = UIColor.white.withAlphaComponent(0.65)
            textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 35, height: 0))
            textField.leftViewMode = .always
            textField.font = .MGothic(type: .sb, size: 13)
            textField.textColor = .black
            textField.layer.cornerRadius = textField.frame.height / 2
            textField.tintColor = UIColor.InsUpColor.red
        }
        
        idTextField.attributedPlaceholder = NSAttributedString(string: "아이디",
                                                               attributes: [NSAttributedString.Key.foregroundColor: UIColor.InsUpColor.black])
        passwdTextField.attributedPlaceholder = NSAttributedString(string: "비밀번호",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor.InsUpColor.black])
    }
    
    func setButtons() {
        let buttons: [UIButton] = [signupButton, findIdPasswdButton]
        
        for button in buttons {
            button.titleLabel?.font = .MGothic(type: .m, size: 12)
            button.setTitleColor(.white, for: .normal)
        }
        
        signupButton.setTitle("회원가입", for: .normal)
        findIdPasswdButton.setTitle("아이디/비밀번호 찾기", for: .normal)
        
        loginButton.backgroundColor = .white
        loginButton.setTitleColor(UIColor.InsUpColor.red, for: .normal)
        loginButton.setTitle("로그인", for: .normal)
        loginButton.layer.cornerRadius = loginButton.frame.height / 2
        loginButton.titleLabel?.font = .MGothic(type: .sb, size: 16)
    }
}

extension LoginMainViewController {
    
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
