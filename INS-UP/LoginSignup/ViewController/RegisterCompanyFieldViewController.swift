//
//  RegisterCompanyFieldViewController.swift
//  InsUp
//
//  Created by 김성은 on 12/11/2019.
//  Copyright © 2019 김성은. All rights reserved.
//

import UIKit

class RegisterCompanyFieldViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var radio1Label: UILabel!
    @IBOutlet weak var radio2Label: UILabel!
    @IBOutlet weak var radio3Label: UILabel!
    @IBOutlet weak var radio4Label: UILabel!
    @IBOutlet weak var radio5Label: UILabel!
    @IBOutlet weak var radio6Label: UILabel!
    @IBOutlet weak var radio7Label: UILabel!
    @IBOutlet weak var radio8Label: UILabel!
    
    @IBOutlet weak var radio1: UIButton!
    @IBOutlet weak var radio2: UIButton!
    @IBOutlet weak var radio3: UIButton!
    @IBOutlet weak var radio4: UIButton!
    @IBOutlet weak var radio5: UIButton!
    @IBOutlet weak var radio6: UIButton!
    @IBOutlet weak var radio7: UIButton!
    @IBOutlet weak var radio8: UIButton!
    var radioArr: [UIButton] = []
    
    @IBOutlet weak var etcTextField: UITextField!
    
    @IBOutlet weak var nextButton: UIButton!
    @IBAction func nextButtonClicked(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "RegisterCEONameViewController") as? RegisterCEONameViewController else { return }
        self.navigationController?.show(vc, sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        titleLabel.font = UIFont.MGothic(type: .r, size: 20)
        radio1Label.font = UIFont.MGothic(type: .r, size: 18)
        radio2Label.font = UIFont.MGothic(type: .r, size: 18)
        radio3Label.font = UIFont.MGothic(type: .r, size: 18)
        radio4Label.font = UIFont.MGothic(type: .r, size: 18)
        radio5Label.font = UIFont.MGothic(type: .r, size: 18)
        radio6Label.font = UIFont.MGothic(type: .r, size: 18)
        radio7Label.font = UIFont.MGothic(type: .r, size: 18)
        radio8Label.font = UIFont.MGothic(type: .r, size: 18)
        etcTextField.font = UIFont.MGothic(type: .r, size: 17)

        radioArr.append(radio1)
        radioArr.append(radio2)
        radioArr.append(radio3)
        radioArr.append(radio4)
        radioArr.append(radio5)
        radioArr.append(radio6)
        radioArr.append(radio7)
        radioArr.append(radio8)
        
        for i in radioArr {
            i.setImage(UIImage.init(named: "ic_reveal"), for: .normal)
            i.setImage(UIImage.init(named: "ic_select"), for: .selected)
            i.isSelected = false
            i.showsTouchWhenHighlighted = true
        }
        
        etcTextField.isEnabled = false
        
        nextButton.layer.cornerRadius = 22
        nextButton.titleLabel?.font = UIFont.MGothic(type: .m, size: 14)
    }
    
    @IBAction func radioClicked(_ sender: UIButton) {
        for i in radioArr {
            i.isSelected = false
        }
        sender.isSelected = true
        if sender.isEqual(radio8) {
            etcTextField.isEnabled = true
        } else {
            etcTextField.isEnabled = false
        }
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
