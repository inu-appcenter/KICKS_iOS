//
//  RegisterDetailAddressViewController.swift
//  InsUp
//
//  Created by 김성은 on 14/11/2019.
//  Copyright © 2019 김성은. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import Alamofire

class RegisterDetailAddressViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    var roadAddr: String?
    var roadAddrPart1: String?
    var jibunAddr: String?
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var mapView: MKMapView!
    var location: CLLocation!
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var jibunLabel: UILabel!
    @IBOutlet weak var roadLabel: UILabel!
    @IBOutlet weak var detailTextField: UITextField!
    
    var addrLat: Double?
    var addrLon: Double?
    
    @IBAction func refreshLocationClicked(_ sender: Any) {
        locationSetting(lat: addrLat!, lon: addrLon!)
    }
    
    @IBOutlet weak var nextButton: UIButton!
    @IBAction func nextButtonClicked(_ sender: Any) {
    }
    
    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        titleLabel.font = UIFont.MGothic(type: .r, size: 20)
        jibunLabel.text = jibunAddr!
        jibunLabel.font = UIFont.MGothic(type: .r, size: 16)
        roadLabel.text = "[도로명] " + roadAddr!
        roadLabel.font = UIFont.MGothic(type: .r, size: 12)
        detailTextField.font = UIFont.MGothic(type: .r, size: 16)
        nextButton.layer.cornerRadius = 22
        nextButton.titleLabel?.font = UIFont.MGothic(type: .m, size: 14)
        
        let url = "https://dapi.kakao.com/v2/local/search/address.json"
        let param: [String : Any] =   [ "query" : roadAddrPart1!]
        AF.request(url, method: .get, parameters: param, encoding: URLEncoding.queryString, headers: ["Authorization" : "KakaoAK 164789dfc7e8ee9e2f9fe5bce7bdd2f4",
            "Content-Type" : "application/x-www-form-urlencoded"]).responseJSON { response in
                switch response.result {
                case .success(let item):
                    //print(item)
                    if let i = item as? NSDictionary {
                        //print(i["documents"]!)
                        if let j = i["documents"] as? NSArray {
                            for k in j {
                                //print(k)
                                let l = k as! NSDictionary
                                let lat = l["y"] as? String ?? ""
                                let lon = l["x"] as? String ?? ""
                                
                                //print("rkskekfk: \(Double(lat)!), \(Double(lon)!)")
                                self.locationSetting(lat: Double(lat)!, lon: Double(lon)!)
                                
                                break
                            }
                        }
                    }
                    break
                case let .failure(error):
                    print(error)
                }
        }
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        mapView.showsUserLocation = true
    }
    
    func locationSetting(lat: Double, lon: Double) {
        //print("dkdkdk: \(lat), \(lon)")
        addrLat = lat
        addrLon = lon
        let center = CLLocationCoordinate2D(latitude: lat, longitude: lon)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = center
        mapView.addAnnotation(annotation)
        mapView.setRegion(region, animated: true)
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
