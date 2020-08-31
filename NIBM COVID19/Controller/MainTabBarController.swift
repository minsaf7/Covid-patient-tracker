//
//  MainTabBarController.swift
//  NIBM COVID19
//
//  Created by Mohamed Minsaf on 8/22/20.
//  Copyright © 2020 Mohamed Minsaf. All rights reserved.
//

import UIKit

class MainTabBarController: UIViewController {
    
    
    let tabBar = UITabBarController()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
      //  navigationController?.navigationBar.isHidden = true
       // self.tabBarController?.navigationController?.setNavigationBarHidden(true, animated: true)
        
       configureTabBar()
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
    
    
    tabBar.viewControllers = [homeTab,updateTab,settingTab]
    self.view.addSubview(tabBar.view)
    
    
    }
    
    // MARK: - Navigation
    
    func configureNavigationBar() {
           navigationController?.navigationBar.isHidden = true
           //navigationController?.navigationBar.barStyle = .black
       }
     
     


}
