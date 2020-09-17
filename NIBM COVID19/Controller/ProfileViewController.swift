//
//  ProfileViewController.swift
//  NIBM COVID19
//
//  Created by Mohamed Minsaf on 9/15/20.
//  Copyright © 2020 Mohamed Minsaf. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    //MARK:- Properties
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
      //  self.title = "Profile"
        
        view.backgroundColor = .systemGray6
        configureNavigationBar()

        // Do any additional setup after loading the view.
    }
    

    
    //MARK: - Helper
    
    func configureUI(){
        
        
        
    }
    
    
    // MARK: - Navigation

    
    func configureNavigationBar() {
           navigationController?.navigationBar.isHidden = true
      //  navigationController?.navigationBar.barStyle = .default
        
       }
    
    

}
