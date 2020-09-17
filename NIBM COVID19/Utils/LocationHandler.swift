//
//  LocationHandler.swift
//  NIBM COVID19
//  Created by Mohamed Minsaf on 9/16/20.
//  Copyright © 2020 Mohamed Minsaf. All rights reserved.


import CoreLocation

class LocationHandler: NSObject, CLLocationManagerDelegate {
//    static let shared = LocationHandler()
//    var locationManager: CLLocationManager!
//    var location: CLLocation?
//
//    override init() {
//        super.init()
//
//        locationManager = CLLocationManager()
//      //  self.locationManager = delegate
//        locationManager.delegate = self
//    }
//
//    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
//        if status == .authorizedWhenInUse {
//             locationManager.requestAlwaysAuthorization()
//        }
//    }
    
    static let shared = LocationHandler()
       var locationManager: CLLocationManager!
       var location: CLLocation?
       
       override init() {
           super.init()
           
           locationManager = CLLocationManager()
           locationManager.delegate = self
       }
       
       func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
           if status == .authorizedWhenInUse {
               locationManager.requestAlwaysAuthorization()
           }
       }
    
}


