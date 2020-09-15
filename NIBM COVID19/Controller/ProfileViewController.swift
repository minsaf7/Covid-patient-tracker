//
//  ProfileViewController.swift
//  NIBM COVID19
//
//  Created by Mohamed Minsaf on 9/15/20.
//  Copyright © 2020 Mohamed Minsaf. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Profile"
        
        view.backgroundColor = .systemGray
        configureNavigationBar()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func configureNavigationBar() {
           navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.barStyle = .default
        
       }
    
    

}
