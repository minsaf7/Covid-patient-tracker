//
//  PostNotificationViewController.swift
//  NIBM COVID19
//
//  Created by Mohamed Minsaf on 9/18/20.
//  Copyright © 2020 Mohamed Minsaf. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase

class PostNotificationViewController: UIViewController {
    
    
    //MARK: - PROPERTIES
    
    private let backButton: UIButton = {
        let button = UIButton(type: .custom)
        let boldConfig = UIImage.SymbolConfiguration(pointSize: .zero, weight: .bold, scale: .large)
        button.setImage(UIImage(systemName: "chevron.left", withConfiguration: boldConfig), for: .normal)
        button.tintColor = .black
       button.addTarget(self, action: #selector(navBack), for: .touchUpInside)
        return button
    }()
    
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Create Notifications"
        label.font = UIFont(name: "Avenir-medium", size: 25)
        label.textColor = .black
        return label
    }()
    
    
    private let notificationUpdateUIView: UIView = {
        
        let tileView = UIView()
        tileView.backgroundColor = .white
        tileView.layer.cornerRadius = 5
        tileView.layer.masksToBounds = true
        return tileView
    }()
    
    private let createNotificationTF: UITextView = {
        
        let text = UITextView()
       // text.borderStyle = .roundedRect
        text.font = UIFont(name: "Avenir-medium", size: 18)
        text.textColor = .black
        text.keyboardAppearance = .dark
        text.isSecureTextEntry = false
        text.layer.borderColor = UIColor.gray.cgColor
        text.layer.borderWidth = 2
        text.layer.cornerRadius = 5
        //text.placeholder = "Type here..."
        
        return text
    }()
    
    private let SubmitNotificationsBtn: CustomAuthButtonUI = {
        
        let button = CustomAuthButtonUI(type: .system)
        button.setTitle("SEND", for: .normal)
        button.backgroundColor = UIColor.black
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth  = 1.0
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitleColor(UIColor(white: 0.5, alpha: 1.5), for: .normal)
        button.addTarget(self, action: #selector(notific), for: UIControl.Event.touchUpInside)
        
        return button
        
    }()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
configureNavigationBar()
        
        LoadUI()
//        view.addSubview(backButton)
//               backButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, paddingTop: 20, paddingLeft: 16, height: 38, width: 38)
        // Do any additional setup after loading the view.
    }
    
    
    //MARK:- Helper
     func LoadUI() {
        
       view.addSubview(backButton)
              backButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, paddingTop: 20, paddingLeft: 16, height: 38, width: 38)
        
        view.addSubview(titleLabel)
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 18)
        titleLabel.centerX(inView: view)
        
        view.addSubview(notificationUpdateUIView)
        notificationUpdateUIView.anchor(top: titleLabel.bottomAnchor, paddingTop: 22,  height: 260,width: 300)
        notificationUpdateUIView.centerX(inView: view)
        
        view.addSubview(createNotificationTF)
        createNotificationTF.anchor(top: notificationUpdateUIView.topAnchor, left: notificationUpdateUIView.leftAnchor, right: notificationUpdateUIView.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingRight: 10, height: 150)
        
        
        view.addSubview(SubmitNotificationsBtn)
        SubmitNotificationsBtn.anchor(top: createNotificationTF.bottomAnchor,  paddingTop: 30, height: 50,width: 100)
        SubmitNotificationsBtn.centerX(inView: view)

    }

    
      func configureNavigationBar() {
             navigationController?.navigationBar.isHidden = true
            // navigationController?.navigationBar.barStyle = .black
         }

    
    // MARK: - Navigation
    
    @objc func navBack(){
        navigationController?.popViewController(animated: true)
    }
    
    
    
    @objc func notific() {
        
        guard let notific = createNotificationTF.text else { return }
        
        let values = [
            "notifications": notific
            ] as [String : Any]
        
        
        if notific.isEmpty {
            
            let ac = UIAlertController(title: "Create notifications", message: "Type your news", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(ac, animated: true)
        }
        else {
            
            Database.database().reference().child("nibm-notifications").childByAutoId().updateChildValues(values) { (error, ref) in
                
                let ac = UIAlertController(title: "Create notifications", message: "Successfully created", preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(ac, animated: true)
                
                self.createNotificationTF.text = ""
            }
        }
    }

    

}
