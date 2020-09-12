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
    
    
    private let signUpButton: CustomAuthButtonUI = {
        let SignButton = CustomAuthButtonUI(type: .system)
        SignButton.setTitle("Sign Up", for: .normal)
        SignButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        SignButton.backgroundColor = .black
        SignButton.addTarget(self, action: #selector(navToSurvey), for: .touchUpInside)
        
        return SignButton
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        
        
     
        
        
        view.addSubview(signUpButton)
        signUpButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20,  paddingRight: -20)

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
    
    
    
    @objc  func navToSurvey(){
        let vc = MainTabBarController()
       navigationController?.pushViewController(vc, animated: true)
    }

}
