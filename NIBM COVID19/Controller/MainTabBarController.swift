//
//  MainTabBarController.swift
//  NIBM COVID19
//
//  Created by Mohamed Minsaf on 8/22/20.
//  Copyright © 2020 Mohamed Minsaf. All rights reserved.
//

import UIKit
import Firebase

class MainTabBarController: UITabBarController {
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        
        checkIsUserLoggedIn()
      //  navigationController?.navigationBar.isHidden = true
       // self.tabBarController?.navigationController?.setNavigationBarHidden(true, animated: true)
        
      // configureTabBar()
        // Do any additional setup after loading the view.
    }
    
    
    
    // MARK: - Tab Bar

   func configureTabBar(){
    
    
    
        let homeTab = HomeViewController()
    homeTab.tabBarItem.title = "Home"
    homeTab.tabBarItem.image = #imageLiteral(resourceName: "home30")
    
    
    let updateTab =  UpdateViewController()
      updateTab.tabBarItem.title = "Update"
    updateTab.tabBarItem.image = #imageLiteral(resourceName: "update30")
    
    let settingTab =  SettingViewController()
      settingTab.tabBarItem.title = "Setting"
    settingTab.tabBarItem.image = #imageLiteral(resourceName: "setting30")
    
    
   viewControllers = [homeTab,updateTab,settingTab]
   // view.addSubview(vie)
    
    }
    
    // MARK: - Navigation
    
    func configureNavigationBar() {
           navigationController?.navigationBar.isHidden = true
           //navigationController?.navigationBar.barStyle = .black
       }
    
    
    //MARK: = API
         
            func checkIsUserLoggedIn() {
                if(Auth.auth().currentUser?.uid == nil) {
    
//                    DispatchQueue.main.async {
//                         let nav = UINavigationController(rootViewController: LoginViewController())
//                        self.present(nav, animated: true, completion: nil)
//
//
//                        self.dismiss(animated: true, completion: nil)
//                    }
                    DispatchQueue.main.async {
                                                      let nav = UINavigationController(rootViewController: LoginViewController())
                                                      nav.modalPresentationStyle = .fullScreen
                                                      self.present(nav, animated: true, completion: nil)
                                                  }
    
    
    
    
    
                } else {
                    print("DEBUG: User is logged in..")
                    
                    configureTabBar()
                    
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
