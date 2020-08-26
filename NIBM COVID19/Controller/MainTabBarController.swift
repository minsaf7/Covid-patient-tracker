//
//  MainTabBarController.swift
//  NIBM COVID19
//
//  Created by Mohamed Minsaf on 8/22/20.
//  Copyright © 2020 Mohamed Minsaf. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

   func configureTabBar(){
        let homeTab = UINavigationController(rootViewController: HomeViewController(/* change the view controller to home */ ))
    homeTab.tabBarItem.title = "Home"
    
    
    
    let updateTab = UINavigationController(rootViewController: UpdateViewController(/* change the view controller to update */ ))
      updateTab.tabBarItem.title = "Update"
    
    let settingTab = UINavigationController(rootViewController: SettingViewController(/* change the view controller to setting */ ))
      settingTab.tabBarItem.title = "Setting"
    
    
    }
     
     


}
