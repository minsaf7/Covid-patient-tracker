//
//  UpdateViewController.swift
//  NIBM COVID19
//
//  Created by Mohamed Minsaf on 8/25/20.
//  Copyright © 2020 Mohamed Minsaf. All rights reserved.
//

import UIKit

class UpdateViewController: UIViewController {

    
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign up for NIBM COVID19"
        label.font = UIFont(name: "Avenir-Light", size: 20)
        label.textColor = UIColor(white: 1, alpha: 0.8)
        
        
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
        view.backgroundColor = .white
       configureNavigationBar()
        
      
        
    configureUI()

        // Do any additional setup after loading the view.
    }
//MARK: - Helper
    
    
    func configureUI(){
        
        
        view.addSubview(createSurteyurveyBtn)
   createSurteyurveyBtn.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor,  right: view.rightAnchor, paddingTop: 40, paddingLeft: 20,  paddingRight: 20)
       
        
        let tempStack = UIStackView(arrangedSubviews: [tempContainer,submitTemperature])
        view.addSubview(tempStack)
        tempStack.axis = .vertical
        
        tempStack.distribution = .fillEqually
        tempStack.spacing = 20
        tempStack.anchor(top: createSurteyurveyBtn.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 50, paddingLeft: 20,  paddingRight: 20)
        
        

        
        
    }
    
    
    
    //MARK: - Selector
    
    @objc  func navToSurvey(){
        let vc = SurveyViewController()
       navigationController?.pushViewController(vc, animated: true)
    }

   // MARK: - Navigation
    
    
  
    
    func configureNavigationBar() {
           navigationController?.navigationBar.isHidden = true
           navigationController?.navigationBar.barStyle = .black
       }

}
