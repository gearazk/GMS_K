//
//  ViewController.swift
//  testmapping
//
//  Created by Stupid on 5/20/16.
//  Copyright © 2016 M.A.R.K. All rights reserved.
//

import UIKit
import GoogleMaps
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    var locationMan : CLLocationManager = CLLocationManager()
    
    var buttonMyLoc : UIButton = UIButton()
    
    var myLocationMarker : GMSMarker = GMSMarker()
    
    var mapview : GMSMapView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        locationMan.delegate = self
        locationMan.desiredAccuracy = kCLLocationAccuracyBest
        
        
        GMSServices.provideAPIKey("AIzaSyDZ8S9we6x-iOVrUIIBYKyKj-3ngQP9za0")
        
        let camera  = GMSCameraPosition.cameraWithLatitude(11.306364, longitude: 106.105834, zoom: 13)
        mapview = GMSMapView.mapWithFrame(CGRectZero, camera: camera)
        
        mapview?.setMinZoom(10, maxZoom: 15)
        
        let position = CLLocationCoordinate2DMake(11.306364, 106.105834)
        myLocationMarker = GMSMarker(position: position)
        
        myLocationMarker.title = "Home"
        myLocationMarker.map = mapview
        
        mapview?.mapType = kGMSTypeNormal // type cua map
        
        view = mapview
        
      
        buttonMyLoc = UIButton(frame: CGRect(x: 10, y: 25, width: 100, height: 30))
        buttonMyLoc.backgroundColor = .blueColor()
        buttonMyLoc.setTitle("Find Me", forState: .Normal)
        buttonMyLoc.addTarget(self, action: #selector(buttonAction), forControlEvents: .TouchUpInside)
        
        self.view.addSubview(buttonMyLoc)
        
    }
    
    func buttonAction(sender: UIButton!) {
        print("Button MyLocation tapped")
        
        if CLLocationManager.authorizationStatus() == .AuthorizedWhenInUse{
            print("Ask in use")
            locationMan.startUpdatingLocation()
        }else if CLLocationManager.authorizationStatus() == .NotDetermined{
            print("Not determinate")
            locationMan.requestWhenInUseAuthorization()
            locationMan.startUpdatingLocation()
        }else if CLLocationManager.authorizationStatus() == .Restricted{
            print("Location not allowed error")
        }

        buttonMyLoc.enabled = false
       
        
    }
    
    func locationManager(manager: CLLocationManager,
                                    didFailWithError error: NSError){
        print("error :")
        print(error)
    }

  
    
    // 6
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("Got it")
        
        locationMan.stopUpdatingLocation()
        let newPosition = locations.first!.coordinate
        if myLocationMarker.position.latitude != newPosition.latitude || myLocationMarker.position.longitude != newPosition.longitude
        {
            print("new")
            myLocationMarker.map = nil
            myLocationMarker = GMSMarker(position : newPosition)
            myLocationMarker.title = "You are here."
            
            CATransaction.begin()
            
            CATransaction.setValue(2, forKey: kCATransactionAnimationDuration)  // (n)s animation
            mapview?.animateToCameraPosition(GMSCameraPosition.cameraWithTarget(newPosition, zoom: 13))
            CATransaction.commit()
            myLocationMarker.map = mapview
        }
        buttonMyLoc.enabled = true
    }
    
    
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

