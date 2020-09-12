//
//  SurveyResultViewController.swift
//  NIBM COVID19
//
//  Created by Mohamed Minsaf on 9/1/20.
//  Copyright © 2020 Mohamed Minsaf. All rights reserved.
//

import UIKit

class SurveyResultViewController: UIViewController {
    var score: Int?
        var totalScore: Int?
        
        override func viewDidLoad() {
            super.viewDidLoad()
            navigationItem.hidesBackButton = true
            
            setupViews()
        }
        
        func showRating() {
            var rating = ""
            var color = UIColor.black
            guard let sc = score, let tc = totalScore else { return }
            let s = sc * 100 / tc
            if s < 10 {
                rating = "You are not infected"
                color = UIColor.darkGray
            }  else if s < 40 {
                rating = "You are not infected"
                color = UIColor.blue
            } else if s < 60 {
                rating = "You are not infected"
                color = UIColor.yellow
            } else if s < 80 {
                rating = "You are infected"
                color = UIColor.red
            } else if s <= 100 {
                rating = "You are infected"
                color = UIColor.orange
            }
            lblRating.text = "\(rating)"
            lblRating.textColor=color
        }
        
        @objc func btnRestartAction() {
            let vc = UpdateViewController()
            self.navigationController?.pushViewController(vc, animated: true)
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
            lblScore.textColor = .white
            
            self.view.addSubview(lblRating)
            lblRating.anchor(top: lblScore.bottomAnchor, paddingTop: 50, width: 300)
            lblRating.centerX(inView: self.view)
//            lblRating.topAnchor.constraint(equalTo: lblScore.bottomAnchor, constant: 40).isActive=true
//            lblRating.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive=true
//            lblRating.widthAnchor.constraint(equalToConstant: 150).isActive=true
//            lblRating.heightAnchor.constraint(equalToConstant: 60).isActive=true
            showRating()
            
            self.view.addSubview(btnRestart)
            btnRestart.topAnchor.constraint(equalTo: lblRating.bottomAnchor, constant: 40).isActive=true
            btnRestart.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive=true
            btnRestart.widthAnchor.constraint(equalToConstant: 150).isActive=true
            btnRestart.heightAnchor.constraint(equalToConstant: 50).isActive=true
            btnRestart.addTarget(self, action: #selector(btnRestartAction), for: .touchUpInside)
        }
        
        let lblTitle: UILabel = {
            let lbl=UILabel()
            lbl.text="Your Score"
            lbl.textColor=UIColor.darkGray
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
            btn.setTitle("Restart", for: .normal)
            btn.setTitleColor(UIColor.white, for: .normal)
            btn.backgroundColor=UIColor.orange
            btn.layer.cornerRadius=5
            btn.clipsToBounds=true
            btn.translatesAutoresizingMaskIntoConstraints=false
            return btn
        }()
        
    }
