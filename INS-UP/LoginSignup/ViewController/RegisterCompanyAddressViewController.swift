//
//  RegisterCompanyAddressViewController.swift
//  InsUp
//
//  Created by 김성은 on 12/11/2019.
//  Copyright © 2019 김성은. All rights reserved.
//

import UIKit
import Alamofire

class RegisterCompanyAddressViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var selectLabel: UILabel!
    
    @IBOutlet weak var searchTextField: UITextField!
    
    var str: String?
    
    @IBOutlet weak var addressTableView: UITableView!
    var searchCount: Int = 0
    var jusoList : [JusoSearch] = []{
        didSet {
            if self.addressTableView != nil {
                self.addressTableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        titleLabel.font = UIFont.MGothic(type: .r, size: 20)
        selectLabel.font = UIFont.MGothic(type: .r, size: 12)
        
        searchTextField.backgroundColor = UIColor.init(named: "veryLightPink")
        searchTextField.font = UIFont.MGothic(type: .r, size: 14)
        searchTextField.layer.cornerRadius = 22
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 47, height: 44))
        searchTextField.leftView = paddingView
        searchTextField.leftViewMode = .always
        
        addressTableView.rowHeight = 80
        addressTableView.dataSource = self
        addressTableView.delegate = self
    }
    
    @IBAction func searchTextFieldDidEndOnExit(_ sender: Any) {
        selectLabel.isHidden = false
        str = searchTextField.text
        
        let url = "http://www.juso.go.kr/addrlink/addrLinkApi.do"
        let param: [String : Any] =   [ "confmKey" : "devU01TX0FVVEgyMDE5MTExNTA0MzcxMDEwOTE5NTI=",
                                        "currentPage" : 1,
                                        "countPerPage" : 100,
                                        "keyword" : str ?? "",
                                        "resultType" : "json"]
        AF.request(url, method: .post, parameters: param, encoding: URLEncoding.httpBody, headers: [:]).responseJSON { response in
            switch response.result {
            case .success(let item):
                // totalCount, errorCode, errorMessage
                // jibunAddr, roadAddr
            
                //print(item)
                var jusoTemp: [JusoSearch] = []
                
                if let i = item as? NSDictionary {
                    for j in i{
                        if let k = j.value as? NSDictionary {
                            if let m = k["common"] as? NSDictionary {
                                self.searchCount = (m["totalCount"] as? NSString ?? "").integerValue
                                //print(self.searchCount)
                            }
                            if let n = k["juso"] as? NSArray {
                                for final in n {
                                    let finall = final as! NSDictionary
                                    //print(final)
                                    let roadAddr = finall["roadAddr"] as? String ?? ""
                                    let jibunAddr = finall["jibunAddr"] as? String ?? ""
                                    let admCd = finall["admCd"] as? String ?? ""
                                    let rnMgtSn = finall["rnMgtSn"] as? String ?? ""
                                    let bdMgtSn = finall["bdMgtSn"] as? String ?? ""
                                    let udrtYn = finall["udrtYn"] as? String ?? ""
                                    let buldMnnm = finall["buldMnnm"] as? String ?? ""
                                    let buldSlno = finall["buldSlno"] as? String ?? ""
                                    
                                    let obj = JusoSearch.init(roadAddr: roadAddr, jibunAddr: jibunAddr, admCd: admCd, rnMgtSn: rnMgtSn, bdMgtSn: bdMgtSn, udrtYn: udrtYn, buldMnnm: buldMnnm, buldSlno: buldSlno)
                                    jusoTemp.append(obj)
                                }
                            }
                        }
                    }
                }
                self.jusoList = jusoTemp
                
                break
            case let .failure(error):
                print(error)
            }
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

extension RegisterCompanyAddressViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jusoList.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = addressTableView.dequeueReusableCell(withIdentifier: "AddressTableViewCell") as? AddressTableViewCell else { return UITableViewCell() }
        
        cell.addressImageView.image = UIImage.init(named: "location")
        cell.address1Label.text = jusoList[indexPath.row].jibunAddr
        cell.address1Label.font = UIFont.MGothic(type: .r, size: 16)
        cell.address2Label.text = "[도로명] " + jusoList[indexPath.row].roadAddr!
        cell.address2Label.font = UIFont.MGothic(type: .r, size: 12)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print("qwer")
        
        print(jusoList[indexPath.row].rnMgtSn!)
    }
    
}
