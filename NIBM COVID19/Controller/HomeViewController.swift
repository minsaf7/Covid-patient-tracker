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
//import LocationInputActivationUIView

class HomeViewController: UIViewController {
    
    
    //MARK: Properties
   // private  let loc = LocationInputActivationUIViev()
    private let covidMap = MKMapView()
            
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        view.addSubview(covidMap)
        covidMap.frame = view.frame
        
        
       
     //   checkIsUserLoggedIn()
         

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Selector
    
    // MARK: - Navigation
    
    func configureNavigationBar() {
           navigationController?.navigationBar.isHidden = true
          // navigationController?.navigationBar.barStyle = .black
       }

    //MARK: API
        
//        func checkIsUserLoggedIn() {
//            if(Auth.auth().currentUser?.uid == nil) {
//
//                DispatchQueue.main.async {
//                     let nav = UINavigationController(rootViewController: LoginViewController())
//                    self.present(nav, animated: true, completion: nil)
//
//
//                    self.dismiss(animated: true, completion: nil)
//                }
//
//
//
//
//
//            } else {
//                print("DEBUG: User is logged in..")
//            }
//        }
        
//        func signOut() {
//            do {
//                try Auth.auth().signOut()
//            } catch {
//                print("DEBUG: sign out error")
//            }
//        }
    }


