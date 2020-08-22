//
//  LoginViewController.swift
//  NIBM COVID19
//
//  Created by Mohamed Minsaf on 8/22/20.
//  Copyright © 2020 Mohamed Minsaf. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    //MARK: Properties
    
    let titleLabel:UILabel={
        let label = UILabel()
        label.text = "NIBM COVID19"
        label.font = UIFont(name: "Avenir-Light", size: 36)
        label.textColor = .cyan
        
        return label
        
    }()
    
    
    
    
    //MARK: Lifecycle
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationBar()
        view.backgroundColor = .gray
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        
        

        // Do any additional setup after loading the view.
    }
    
    
    
    

    
    // MARK: - Navigation

    func configureNavigationBar() {
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
    }
    

}
