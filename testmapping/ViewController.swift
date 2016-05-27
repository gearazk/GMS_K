//
//  ViewController.swift
//  testmapping
//
//  Created by Stupid on 5/20/16.
//  Copyright © 2016 M.A.R.K. All rights reserved.
//

import UIKit
import GoogleMaps


class ViewController: UIViewController, CLLocationManagerDelegate {

    var locationMan : CLLocationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("start")
        locationMan.delegate = self
        locationMan.desiredAccuracy = kCLLocationAccuracyBest
        
        locationMan.requestWhenInUseAuthorization()
        locationMan.startUpdatingLocation()

        //CheckAuthLocation()
       
//        GMSServices.provideAPIKey("AIzaSyDZ8S9we6x-iOVrUIIBYKyKj-3ngQP9za0")
//        
//        let camera  = GMSCameraPosition.cameraWithLatitude(11.306364, longitude: 106.105834, zoom: 10)
//        let mapview = GMSMapView.mapWithFrame(CGRectZero, camera: camera)
//        
//        mapview.setMinZoom(10, maxZoom: 15)
//        
//        let  position = CLLocationCoordinate2DMake(11.306364, 106.105834)
//        let marker = GMSMarker(position: position)
//        
//        marker.title = "Home"
//        marker.map = mapview
//        
//        mapview.mapType = kGMSTypeNormal // type cua map
//        
//        view = mapview
//        //
//        HelloLabel()
//        
        
    }
    func locationManager(manager: CLLocationManager,
                                    didFailWithError error: NSError){
        print(error)
    }

    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]! ){
        print("Got location")
    }
//    func CheckAuthLocation(){
//        if CLLocationManager.authorizationStatus() == .AuthorizedWhenInUse{
//            print("Ask in use")
//            locationMan.startUpdatingLocation()
//        }else if CLLocationManager.authorizationStatus() == .NotDetermined{
//            print("Not determinate")
//            locationMan.requestWhenInUseAuthorization()
//            locationMan.startUpdatingLocation()
//        }else if CLLocationManager.authorizationStatus() == .Restricted{
//            print("Location not allowed error")
//        }
//    }
//    
//    func HelloLabel(){
//        let helloLabel = UILabel()
//        helloLabel.frame = CGRectMake(100,150,150,60)
//        
//        
//        let myAttStr = NSMutableAttributedString(string:"HELlo World",attributes:[NSFontAttributeName: UIFont(name: "Chalkduster", size: 18.0)!])
//        
//        myAttStr.addAttribute(NSFontAttributeName, value: UIFont(name: "American Typewriter", size: 25.0)!, range: NSRange(location:5,length:6))
//        myAttStr.addAttribute(NSForegroundColorAttributeName, value: UIColor.blueColor(), range: NSRange(location:5,length:6))
//        
//        
//        helloLabel.attributedText = myAttStr
//        
//        
//        view.addSubview(helloLabel)
//    }

}

