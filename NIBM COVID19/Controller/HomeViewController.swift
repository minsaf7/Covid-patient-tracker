//
//  HomeViewController.swift
//  NIBM COVID19
//
//  Created by Mohamed Minsaf on 8/25/20.
//  Copyright © 2020 Mohamed Minsaf. All rights reserved.
//

import UIKit
import Firebase
import MapKit


class HomeViewController: UIViewController {
    
    
    //MARK: Properties
  
    private let userMap = MKMapView()
    private let locationManager = CLLocationManager()
    private let inputActivationUIView = LocationInputActivationUIView ()
            
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
       
     checkIsUserLoggedIn()
      //  signOut()
        
    }
    

    
    // MARK: - Configuring UI
    
    func configureUI(){
         configureNavigationBar()
        setMap()
        view.addSubview(inputActivationUIView)
        inputActivationUIView.centerX(inView: view)
        inputActivationUIView.setDimensions(height: 50, width: view.frame.width - 64)
        inputActivationUIView.anchor(top: view.safeAreaLayoutGuide.topAnchor,paddingTop: 20)
        
        inputActivationUIView.alpha = 0
        
        UIView.animate(withDuration: 2) {
            self.inputActivationUIView.alpha = 1
        }
        
       
    }
    
    
    func setMap(){
        
        view.addSubview(userMap)
               userMap.frame = view.frame
        
        userMap.showsUserLocation = true
        userMap.userTrackingMode = .follow
    }
    
    // MARK: - Navigation
    
    func configureNavigationBar() {
           navigationController?.navigationBar.isHidden = true
          // navigationController?.navigationBar.barStyle = .black
       }
    
    
    // MARK: - Selectors
    
   
    
    
    
    func checkIsUserLoggedIn() {
                   if(Auth.auth().currentUser?.uid == nil) {
       
//                       DispatchQueue.main.async {
//                            let nav = UINavigationController(rootViewController: LoginViewController())
//                           self.present(nav, animated: true, completion: nil)
//
//
//                           self.dismiss(animated: true, completion: nil)
//                       }
                    DispatchQueue.main.async {
                                   let nav = UINavigationController(rootViewController: LoginViewController())
                                   nav.modalPresentationStyle = .fullScreen
                                   self.present(nav, animated: true, completion: nil)
                               }
       
       
       
       
       
                   } else {
                       print("DEBUG: User is logged in..")
                    // setMap()
                    configureUI()
                    
                   }
               }

    
    
    
    
    func signOut() {
                  do {
                      try Auth.auth().signOut()
                  } catch {
                      print("DEBUG: sign out error")
                  }
              }
       
    
    
    
    
    
    
    
   
    }

//MARK: - Location services


//extension HomeViewController {
//
//    func enableLocationServices() {
//        switch CLLocationManager.authorizationStatus() {
//        case .notDetermined:
//            locationManager?.requestWhenInUseAuthorization()
//        case .restricted, .denied:
//            break
//        case .authorizedWhenInUse:
//            locationManager?.requestAlwaysAuthorization()
//        case .authorizedAlways:
//            locationManager?.startUpdatingLocation()
//            locationManager?.desiredAccuracy = kCLLocationAccuracyBest
//        default:
//            break
//        }
//    }
//}



extension HomeViewController : CLLocationManagerDelegate{
    func enableLocationServices(){

        locationManager.delegate = self

        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            print("Not determined")
       case .restricted, .denied:
            break
        case .authorizedWhenInUse:
            locationManager.requestAlwaysAuthorization()
            print("DEBUG: authorized When In Use")
        case .authorizedAlways:
            locationManager.startUpdatingLocation()
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            print("DEBUG: authorized Always")
        default:
            break
        }

    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationManager.requestAlwaysAuthorization()
        }

    }



}

extension HomeViewController: LocationInputActivationUIViewDelegate {
    func presentLocationInputView() {
        print("DEBUG: LocationInputActivationUIViewDelegate called")
    }
}
