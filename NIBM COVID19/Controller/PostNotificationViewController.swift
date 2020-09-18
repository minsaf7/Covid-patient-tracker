//
//  PostNotificationViewController.swift
//  NIBM COVID19
//
//  Created by Mohamed Minsaf on 9/18/20.
//  Copyright © 2020 Mohamed Minsaf. All rights reserved.
//

import UIKit

class PostNotificationViewController: UIViewController {
    
    
    //MARK: - PROPERTIES
    
    private let backButton: UIButton = {
        let button = UIButton(type: .custom)
        let boldConfig = UIImage.SymbolConfiguration(pointSize: .zero, weight: .bold, scale: .large)
        button.setImage(UIImage(systemName: "chevron.left", withConfiguration: boldConfig), for: .normal)
        button.tintColor = .black
       button.addTarget(self, action: #selector(navBack), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
configureNavigationBar()
        view.addSubview(backButton)
               backButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, paddingTop: 20, paddingLeft: 16, height: 38, width: 38)
        // Do any additional setup after loading the view.
    }
    
    
      func configureNavigationBar() {
             navigationController?.navigationBar.isHidden = true
            // navigationController?.navigationBar.barStyle = .black
         }

    
    // MARK: - Navigation
    
    @objc func navBack(){
        navigationController?.popViewController(animated: true)
    }

    

}
