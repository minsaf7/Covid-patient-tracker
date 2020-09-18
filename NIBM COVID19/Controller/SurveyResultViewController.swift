//
//  SurveyResultViewController.swift
//  NIBM COVID19
//
//  Created by Mohamed Minsaf on 9/1/20.
//  Copyright © 2020 Mohamed Minsaf. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

class SurveyResultViewController: UIViewController {
    var score: Int?
        var totalScore: Int?
        
        override func viewDidLoad() {
            super.viewDidLoad()
           // navigationItem.hidesBackButton = true
            
            view.backgroundColor = .systemGray6
            configureNavigationBar()
            setupViews()
        }
        
        func showRating() {
            var rating = ""
            var color = UIColor.black
            guard let sc = score, let tc = totalScore else { return }
            let s = sc * 100 / tc
            if s < 10 {
                rating = "You are not infected"
                color = UIColor.green
            }  else if s < 40 {
                rating = "You are not infected"
                color = UIColor.green
            } else if s < 60 {
                rating = "You are not infected"
                color = UIColor.green
            } else if s < 80 {
                rating = "You are infected"
                color = UIColor.red
            } else if s <= 100 {
                rating = "You are infected"
                color = UIColor.red
            }
            lblRating.text = "\(rating)"
            lblRating.textColor=color
        }
        
        @objc func btnRestartAction() {
            let vc = MainTabBarController()
            //self.navigationController?.pushViewController(vc, animated: true)
           // vc.hidesBottomBarWhenPushed = true
                 //  self.navigationController?.pushViewController(vc, animated: true)
            vc.modalPresentationStyle = .fullScreen
            present(vc,animated: true,completion: {})
            
        }
    
    
    
    @objc func submitSurvey() {
        
        
        guard let userID = Auth.auth().currentUser?.uid else {return}
        
               let values = [
                "surveyScore": score ?? 0
                      ] as [String: Any ]


                      
                          Database.database().reference().child("users").child(userID).updateChildValues(values) {(error,ref) in

                              let popAlert = UIAlertController(title: "Temperature", message: "Temperature successfully updated", preferredStyle: .alert)
                                         popAlert.addAction(UIAlertAction(title: "OK", style: .default))
                              self.present(popAlert,animated: true)

                          }
                      
               
           }
        
        func setupViews() {
            
            
            self.view.addSubview(lblTitle)
            lblTitle.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 80).isActive=true
            lblTitle.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive=true
            lblTitle.widthAnchor.constraint(equalToConstant: 250).isActive=true
            lblTitle.heightAnchor.constraint(equalToConstant: 80).isActive=true
            
            self.view.addSubview(lblScore)
            lblScore.anchor(top: lblTitle.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 10, paddingLeft: 20,  paddingRight: 20)
            
//            lblScore.topAnchor.constraint(equalTo: lblTitle.bottomAnchor, constant: 0).isActive=true
//            lblScore.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive=true
//            lblScore.widthAnchor.constraint(equalToConstant: 150).isActive=true
//            lblScore.heightAnchor.constraint(equalToConstant: 60).isActive=true
            lblScore.text = "\(score!) / \(totalScore!)"
            lblScore.textColor = .black
            
            self.view.addSubview(lblRating)
            lblRating.anchor(top: lblScore.bottomAnchor, paddingTop: 50, width: 300)
            lblRating.centerX(inView: self.view)
//            lblRating.topAnchor.constraint(equalTo: lblScore.bottomAnchor, constant: 40).isActive=true
//            lblRating.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive=true
//            lblRating.widthAnchor.constraint(equalToConstant: 150).isActive=true
//            lblRating.heightAnchor.constraint(equalToConstant: 60).isActive=true
            showRating()
            
            self.view.addSubview(btnRestart)
//            btnRestart.topAnchor.constraint(equalTo: lblRating.bottomAnchor, constant: 40).isActive=true
//            btnRestart.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive=true
//            btnRestart.widthAnchor.constraint(equalToConstant: 150).isActive=true
//            btnRestart.heightAnchor.constraint(equalToConstant: 50).isActive=true
            btnRestart.anchor(top: lblRating.bottomAnchor, paddingTop: 40, height: 50, width: 150)
            btnRestart.centerX(inView: view)
            btnRestart.addTarget(self, action: #selector(btnRestartAction), for: .touchUpInside)
            
            
            self.view.addSubview(btnSubmit)
            btnSubmit.anchor(top: btnRestart.bottomAnchor, paddingTop: 10, height: 50, width: 150)
            btnSubmit.centerX(inView: view)
            
        }
    
        
        let lblTitle: UILabel = {
            let lbl=UILabel()
            lbl.text="Your Score"
            lbl.textColor=UIColor.black
            lbl.textAlignment = .center
            lbl.font = UIFont.systemFont(ofSize: 46)
            lbl.numberOfLines=2
            lbl.translatesAutoresizingMaskIntoConstraints=false
            return lbl
        }()
        
        let lblScore: UILabel = {
            let lbl=UILabel()
            lbl.text="0 / 0"
            lbl.textColor=UIColor.black
            lbl.textAlignment = .center
            lbl.font = UIFont.boldSystemFont(ofSize: 24)
            lbl.translatesAutoresizingMaskIntoConstraints=false
            return lbl
        }()
        
        let lblRating: UILabel = {
            let lbl=UILabel()
            lbl.text="Good"
            lbl.textColor=UIColor.black
            lbl.textAlignment = .center
            lbl.font = UIFont.boldSystemFont(ofSize: 16)
            lbl.translatesAutoresizingMaskIntoConstraints=false
            return lbl
        }()
        
        let btnRestart: UIButton = {
            let btn = UIButton()
            btn.setTitle("Go to Home", for: .normal)
            btn.setTitleColor(UIColor.white, for: .normal)
            btn.backgroundColor=UIColor.black
            btn.layer.cornerRadius=5
            btn.clipsToBounds=true
            btn.translatesAutoresizingMaskIntoConstraints=false
            return btn
        }()
    
    let btnSubmit: UIButton = {
              let btn = UIButton()
              btn.setTitle("Submit Score", for: .normal)
              btn.setTitleColor(UIColor.white, for: .normal)
              btn.backgroundColor=UIColor.black
              btn.layer.cornerRadius=5
              btn.clipsToBounds=true
              btn.translatesAutoresizingMaskIntoConstraints=false
         btn.addTarget(self, action: #selector(submitSurvey), for: .touchUpInside)
              return btn
          }()
     
    
  func  configureNavigationBar(){
         navigationController?.navigationBar.isHidden = true
        
    }
    
    
    }
