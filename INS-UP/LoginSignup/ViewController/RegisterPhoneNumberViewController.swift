//
//  RegisterPhoneNumberViewController.swift
//  INS-UP
//
//  Created by 김성은 on 15/11/2019.
//  Copyright © 2019 Cho. All rights reserved.
//

import UIKit

class RegisterPhoneNumberViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var numLabel: UILabel!
    
    @IBOutlet weak var nextButton: UIButton!
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
        numLabel.font = UIFont.MGothic(type: .r, size: 10)
        nextButton.layer.cornerRadius = 22
        nextButton.titleLabel?.font = UIFont.MGothic(type: .m, size: 14)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
