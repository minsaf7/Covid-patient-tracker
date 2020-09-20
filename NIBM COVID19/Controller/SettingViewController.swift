//
//  SettingViewController.swift
//  NIBM COVID19
//
//  Created by Mohamed Minsaf on 8/25/20.
//  Copyright © 2020 Mohamed Minsaf. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SettingViewController: UIViewController {

    
    // MARK: - Properties
       
    private let titleLbl: UILabel = {
           let label = UILabel()
           label.text = "Settings"
           label.font = UIFont(name: "Avenir-Light", size: 30)
           label.textColor = .black
           return label
       }()
    
    
    private let profileButtonContainer: UIButton = {
           let tile = UIButton()
           tile.backgroundColor = .white
           
           let title = UILabel()
           title.text = "Profile"
           title.textColor = .black
           tile.addSubview(title)
           //title.backgroundColor = .green
           title.anchor(top: tile.topAnchor, left: tile.leftAnchor, bottom: tile.bottomAnchor, paddingLeft: 20)
           title.centerY(inView: tile)
           
           let arrow = UIImageView()
           arrow.image = UIImage(systemName: "chevron.right")
           //arrow.backgroundColor = .green
           arrow.tintColor = .black
           arrow.layer.masksToBounds = true
           tile.addSubview(arrow)
          // arrow.anchor(right: tile.rightAnchor, paddingRight: 20, width: 14, height: 24)
        arrow.anchor( right: tile.rightAnchor, paddingRight: 10, height: 24, width: 14)
           arrow.centerY(inView: tile)
           
//           let separatorView = UIView()
//           separatorView.backgroundColor = .lightGray
//           tile.addSubview(separatorView)
//           separatorView.anchor(left: tile.leftAnchor, bottom: tile.bottomAnchor, right: tile.rightAnchor, paddingLeft: 8, paddingRight: 8, height: 0.75)
           
          tile.addTarget(self, action: #selector(showProfile), for: .touchUpInside)
           
           return tile
       }()
    
    
    private let contactButtonContainer: UIButton = {
           let tile = UIButton()
           tile.backgroundColor = .white
           
           let title = UILabel()
           title.text = "Contact Us / About Us"
           title.textColor = .black
           tile.addSubview(title)
           //title.backgroundColor = .green
           title.anchor(top: tile.topAnchor, left: tile.leftAnchor, bottom: tile.bottomAnchor, paddingLeft: 20)
           title.centerY(inView: tile)
           
           let arrow = UIImageView()
           arrow.image = UIImage(systemName: "chevron.right")
           //arrow.backgroundColor = .green
           arrow.tintColor = .black
           arrow.layer.masksToBounds = true
           tile.addSubview(arrow)
           arrow.anchor(right: tile.rightAnchor, paddingRight: 20,  height: 24, width: 14)
           arrow.centerY(inView: tile)
           
//           let separatorView = UIView()
//           separatorView.backgroundColor = .lightGray
//           tile.addSubview(separatorView)
//           separatorView.anchor(left: tile.leftAnchor, bottom: tile.bottomAnchor, right: tile.rightAnchor, paddingLeft: 8, paddingRight: 8, height: 0.75)
           
        //   tile.addTarget(self, action: #selector(showContact), for: .touchUpInside)
           
           return tile
       }()
    
    private let shareButtonContainer: UIButton = {
           let tile = UIButton()
           tile.backgroundColor = .white
           
           let title = UILabel()
           title.text = "Share with friend"
           title.textColor = .systemBlue
           tile.addSubview(title)
           //title.backgroundColor = .green
           title.anchor(top: tile.topAnchor, left: tile.leftAnchor, bottom: tile.bottomAnchor, paddingLeft: 20)
           title.centerY(inView: tile)
           
           let arrow = UIImageView()
           arrow.image = UIImage(systemName: "chevron.right")
           //arrow.backgroundColor = .green
           arrow.layer.masksToBounds = true
           tile.addSubview(arrow)
           arrow.anchor(right: tile.rightAnchor, paddingRight: 20, height: 24, width: 14)
           arrow.centerY(inView: tile)
                   
         //  tile.addTarget(self, action: #selector(handleShare), for: .touchUpInside)
           
           return tile
       }()
    
    
    private let logoutButton: UIButton = {
           let button = UIButton()
           button.backgroundColor = .white
           button.setTitle("LOGOUT", for: .normal)
           button.setTitleColor(.black, for: .normal)
           button.titleLabel?.font = UIFont(name: "Avenir-Medium", size: 14)
          // button.addTextSpacing(2)
           button.addTarget(self, action: #selector(handleLogout), for: .touchUpInside)
           return button
       }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         view.backgroundColor = .systemGray6
        configureNavigationBar()
        configureUI()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Navigation
    
    func configureNavigationBar() {
           navigationController?.navigationBar.isHidden = true
           navigationController?.navigationBar.barStyle = .black
       }
    
    
    func configureUI(){
 
       view.addSubview(titleLbl)
        titleLbl.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 20)
        titleLbl.centerX(inView: view)
        
        let stack = UIStackView(arrangedSubviews: [profileButtonContainer, contactButtonContainer, shareButtonContainer])
              stack.axis = .vertical
              stack.distribution = .fillProportionally
              stack.spacing = 5
        
        view.addSubview(stack)
        stack.anchor(top: titleLbl.bottomAnchor,  paddingTop: 20, height: 210,width: 370)
        stack.centerX(inView: view)
        
        view.addSubview(logoutButton)
        logoutButton.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, height: 60)
        
    }
    
    
    
    //MARK: - API
    
    @objc func showProfile(){
        
        checkIsUserLoggedIn()
         
        let vc = ProfileViewController()
               vc.hidesBottomBarWhenPushed = true
             //  self.navigationController?.pushViewController(vc, animated: true)
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    @objc func handleLogout(){
        signOut()
        print("Clicked")
    }
    
    func signOut() {
                  do {
                      try Auth.auth().signOut()
                    
                    print("Logged out")
                   //let vc = LoginViewController()
                   let nav = LoginViewController()
                                                self.navigationController?.pushViewController(nav, animated: true)
                    
                    
                  } catch {
                      print("DEBUG: sign out error")
                  }
              }
    
    
    func checkIsUserLoggedIn() {
                        if(Auth.auth().currentUser?.uid == nil) {
            
                            DispatchQueue.main.async {
                                                              let nav = LoginViewController()
                                  self.navigationController?.pushViewController(nav, animated: true)
    //                                                          nav.modalPresentationStyle = .fullScreen
    //                                                          self.present(nav, animated: true, completion: nil)
                                                          }
            
            
            
            
            
                        } else {
                            print("DEBUG: User is logged in..")
                             configureUI()
                         
                            
                        }
                    }


}
