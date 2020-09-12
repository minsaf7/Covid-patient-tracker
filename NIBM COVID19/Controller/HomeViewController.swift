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
            
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        view.addSubview(userMap)
        userMap.frame = view.frame
        
    }
    

    
    // MARK: - Selector
    
    // MARK: - Navigation
    
    func configureNavigationBar() {
           navigationController?.navigationBar.isHidden = true
          // navigationController?.navigationBar.barStyle = .black
       }

   
    }


