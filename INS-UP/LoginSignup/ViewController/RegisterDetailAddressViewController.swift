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

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    var latlonList: [LatLon] = []
    
    @IBOutlet weak var jibunLabel: UILabel!
    @IBOutlet weak var roadLabel: UILabel!
    @IBOutlet weak var detailTextField: UITextField!
    
    @IBOutlet weak var nextButton: UIButton!
    @IBAction func nextButtonClicked(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        titleLabel.font = UIFont.MGothic(type: .r, size: 20)
        jibunLabel.font = UIFont.MGothic(type: .r, size: 16)
        roadLabel.font = UIFont.MGothic(type: .r, size: 12)
        detailTextField.font = UIFont.MGothic(type: .r, size: 16)
        nextButton.layer.cornerRadius = 22
        nextButton.titleLabel?.font = UIFont.MGothic(type: .m, size: 14)
        
        //var latlonTemp : [LatLon] = []
        let url = "https://dapi.kakao.com/v2/local/geo/transcoord.json"
        let param: [String : Any] =   [ "x" : "923313.2985716499",
        "y" : "1939290.9863213482",
        "input_coord" : "UTM",
        "output_coord" : "WGS84"]
        AF.request(url, method: .get, parameters: param, encoding: URLEncoding.queryString, headers: ["Authorization" : "KakaoAK 164789dfc7e8ee9e2f9fe5bce7bdd2f4",
            "Content-Type" : "application/x-www-form-urlencoded"]).responseJSON { response in
                switch response.result {
                case .success(let item):
                    var latlonTemp : [LatLon] = []
                    if let i = item as? NSDictionary {
                        //print(i["documents"]!)
                        if let j = i["documents"] as? NSArray {
                            for k in j {
                                let l = k as! NSDictionary
                                let lat = l["y"] as? Double ?? 0
                                let lon = l["x"] as? Double ?? 0
                                let obj = LatLon.init(lat: lat, lon: lon)
                                latlonTemp.append(obj)
                                break
                            }
                        }
                    }
                    self.latlonList = latlonTemp
                    break
                case let .failure(error):
                    print(error)
                }
        }
        
        // 여기서 latlonList를 가져오면 값이 초기화 되어있음!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        
        /*locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()*/
        
        mapView.showsUserLocation = true
        /*
        let center = CLLocationCoordinate2D(latitude: latlonList[0].lat!, longitude: latlonList[0].lon!)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        mapView.setRegion(region, animated: true)*/
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    /*func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        
        let location = locations.last
        
        let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
        //let center = CLLocationCoordinate2D(latitude: lat  , longitude: lon)
        
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        mapView.setRegion(region, animated: true)
        
        locationManager.startUpdatingLocation()
    }*/
}
