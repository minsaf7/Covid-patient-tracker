//
//  UpdateViewController.swift
//  NIBM COVID19
//
//  Created by Mohamed Minsaf on 8/25/20.
//  Copyright © 2020 Mohamed Minsaf. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class UpdateViewController: UIViewController {

    
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "UPDATE"
        label.font = UIFont(name: "Avenir-Light", size: 20)
        label.textColor = .black
        
        
        return label
    }()
    
      private let surveyButtonContainer: UIButton = {
               let tile = UIButton()
               tile.backgroundColor = .white
               
               let title = UILabel()
               title.text = "New Survey"
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
            arrow.anchor( right: tile.rightAnchor, paddingRight: 20, height: 24, width: 14)
               arrow.centerY(inView: tile)
               
    //           let separatorView = UIView()
    //           separatorView.backgroundColor = .lightGray
    //           tile.addSubview(separatorView)
    //           separatorView.anchor(left: tile.leftAnchor, bottom: tile.bottomAnchor, right: tile.rightAnchor, paddingLeft: 8, paddingRight: 8, height: 0.75)
               
              tile.addTarget(self, action: #selector(navToSurvey), for: .touchUpInside)
               
               return tile
           }()
    
     private let notificationButtonContainer: UIButton = {
                  let tile = UIButton()
                  tile.backgroundColor = .white
                  
                  let title = UILabel()
                  title.text = "Create notification"
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
               arrow.anchor( right: tile.rightAnchor, paddingRight: 20, height: 24, width: 14)
                  arrow.centerY(inView: tile)
                  
       //           let separatorView = UIView()
       //           separatorView.backgroundColor = .lightGray
       //           tile.addSubview(separatorView)
       //           separatorView.anchor(left: tile.leftAnchor, bottom: tile.bottomAnchor, right: tile.rightAnchor, paddingLeft: 8, paddingRight: 8, height: 0.75)
                  
                 tile.addTarget(self, action: #selector(navToSurvey), for: .touchUpInside)
                  
                  return tile
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
    
    private let lblTemperature: UILabel = {
        let label = UILabel()
        label.text = "30.0' C"
        label.font = UIFont(name: "Avenir-Light", size: 20)
        label.textColor = .black
        
        
        return label
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
     temperatureBtn.addTarget(self, action: #selector(submitTemp), for: .touchUpInside)
        
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
        
        
        view.addSubview(notificationButtonContainer)
        notificationButtonContainer.layer.cornerRadius = 5
        notificationButtonContainer.anchor(top: titleLabel.bottomAnchor, paddingTop: 30, height: 75, width: 300)
        notificationButtonContainer.centerX(inView: view)
        
        view.addSubview(surveyButtonContainer)
        surveyButtonContainer.layer.cornerRadius = 5
   surveyButtonContainer.anchor(top: notificationButtonContainer.bottomAnchor,  paddingTop:  10,height: 75, width: 300)
        surveyButtonContainer.centerX(inView: view)
        
        view.addSubview(lblTemperature)
        lblTemperature.anchor(top: surveyButtonContainer.bottomAnchor,paddingTop: 20)
        lblTemperature.centerX(inView: view)
        
        let tempStack = UIStackView(arrangedSubviews: [tempContainer,submitTemperature])
        view.addSubview(tempStack)
        tempStack.axis = .vertical
        
        tempStack.distribution = .fillEqually
        tempStack.spacing = 20
        tempStack.anchor(top: lblTemperature.bottomAnchor,  paddingTop: 20, width: 300)
        tempStack.centerX(inView: view)
        
        

        
        
    }
    
    
    
    //MARK: - Selector
    
    @objc  func navToSurvey(){
        
        checkIsUserLoggedIn()
        
         print("DEBUG: Clicked..")
//        let vc = SurveyViewController()
//       navigationController?.pushViewController(vc, animated: true)
        let vc = SurveyViewController()
        vc.hidesBottomBarWhenPushed = true
                   //  self.navigationController?.pushViewController(vc, animated: true)
              vc.modalPresentationStyle = .fullScreen
              present(vc,animated: true,completion: {})
//        vc.hidesBottomBarWhenPushed = true
//        self.navigationController?.pushViewController(vc, animated: false)
        
        
        
    }
    //MARK: - API
    
    
   @objc func submitTemp(){
        guard let temperature = temperatureTextfield.text else {return}
        guard let bodyTemp = Int(temperature) else {return}
        guard let userID = Auth.auth().currentUser?.uid else {return}




        let values = [
            "bodyTemp": bodyTemp
        ] as [String: Any ]

        if temperature.isEmpty{
            let popAlert = UIAlertController(title: "Temperature", message: "Temperature cannot be null", preferredStyle: .alert)
            popAlert.addAction(UIAlertAction(title: "OK", style: .default))
           self.present(popAlert, animated: true)
        }

        else
        {
            Database.database().reference().child("users").child(userID).updateChildValues(values) {(error,ref) in

                let popAlert = UIAlertController(title: "Temperature", message: "Temperature successfully updated", preferredStyle: .alert)
                           popAlert.addAction(UIAlertAction(title: "OK", style: .default))

            }
        }
        
    }

   // MARK: - Navigation
    
    
  
    
    func configureNavigationBar() {
           navigationController?.navigationBar.isHidden = true
          // navigationController?.navigationBar.barStyle = .black
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
