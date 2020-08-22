//
//  SplashscreenViewController.swift
//  NIBM COVID19
//
//  Created by Mohamed Minsaf on 8/22/20.
//  Copyright © 2020 Mohamed Minsaf. All rights reserved.
//

import UIKit

class SplashscreenViewController: UIViewController {
    
    
    //MARK: Properties
    
    private let imageViewContainer:UIView = {
        
        
        let image = UIImageView()
        image.backgroundColor = .red
       
       return image
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        
        
        view.addSubview(imageViewContainer)
        imageViewContainer.translatesAutoresizingMaskIntoConstraints = false
        imageViewContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageViewContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        

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

}
