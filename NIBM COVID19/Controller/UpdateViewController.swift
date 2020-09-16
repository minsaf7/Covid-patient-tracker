//
//  UpdateViewController.swift
//  NIBM COVID19
//
//  Created by Mohamed Minsaf on 8/25/20.
//  Copyright © 2020 Mohamed Minsaf. All rights reserved.
//

import UIKit
import Firebase

class UpdateViewController: UIViewController {

    
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "UPDATE"
        label.font = UIFont(name: "Avenir-Light", size: 20)
        label.textColor = .black
        
        
        return label
    }()
    
    private let createSurteyurveyBtn :CustomAuthButtonUI = {
        let surveyBtn = CustomAuthButtonUI(type: .system)
        surveyBtn.setTitle("Create Survey", for: .normal)
        surveyBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        surveyBtn.backgroundColor = .black
        surveyBtn.setTitleColor(UIColor(white: 1, alpha: 1), for: .normal)
        surveyBtn.addTarget(self, action: #selector(navToSurvey), for: .touchUpInside)
        
        return surveyBtn
    }()
    
    
    private let temperatureTextfield : UITextField = {
        return UITextField().textField(withPlaceholder: "ENTER TEMPERATURE", isSecureTextEntry: false)
    }()
    

    private let submitTemperature :CustomAuthButtonUI = {
        let temperatureBtn = CustomAuthButtonUI(type: .system)
        temperatureBtn.setTitle("Submit temperature", for: .normal)
        temperatureBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        temperatureBtn.backgroundColor = .black
      
        temperatureBtn.setTitleColor(UIColor(white: 1, alpha: 1), for: .normal)
  //    surveyBtn.addTarget(self, action: #selector(createSurvey), for: .touchUpInside)
        
        return temperatureBtn
    }()
    
     private lazy var tempContainer:UIView = {
           return UIView().inputContainerView(textField: temperatureTextfield as UITextField)
       }()
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
       configureNavigationBar()
        
     // checkIsUserLoggedIn()
      configureUI()
   

        // Do any additional setup after loading the view.
    }
//MARK: - Helper
    
    
    func configureUI(){
        
        view.addSubview(titleLabel)
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 5)
        titleLabel.centerX(inView: view)
        
        view.addSubview(createSurteyurveyBtn)
   createSurteyurveyBtn.anchor(top: titleLabel.bottomAnchor,  paddingBottom:  30, width: 300)
        createSurteyurveyBtn.centerX(inView: view)
        
        let tempStack = UIStackView(arrangedSubviews: [tempContainer,submitTemperature])
        view.addSubview(tempStack)
        tempStack.axis = .vertical
        
        tempStack.distribution = .fillEqually
        tempStack.spacing = 20
        tempStack.anchor(top: createSurteyurveyBtn.bottomAnchor,  paddingTop: 50, width: 300)
        tempStack.centerX(inView: view)
        
        

        
        
    }
    
    
    
    //MARK: - Selector
    
    @objc  func navToSurvey(){
        
         print("DEBUG: Clicked..")
//        let vc = SurveyViewController()
//       navigationController?.pushViewController(vc, animated: true)
        let vc = SurveyViewController()
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: false)
        
        
        
    }

   // MARK: - Navigation
    
    
  
    
    func configureNavigationBar() {
           navigationController?.navigationBar.isHidden = true
           navigationController?.navigationBar.barStyle = .black
       }
    
    
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
                        
                     configureUI()
                        
                    }
                }

}
