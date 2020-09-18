//
//  ProfileViewController.swift
//  NIBM COVID19
//
//  Created by Mohamed Minsaf on 9/15/20.
//  Copyright © 2020 Mohamed Minsaf. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    //MARK:- Properties
    
    var selectedImage: UIImage?
        
    //    let countries = ["Sri Lanka","India","Pakistan","America","England","Japan"]
    //    var pickerView = UIPickerView()
        
        private let titleLabel: UILabel = {
            
            let label = UILabel()
            label.text = "User Profile"
            //label.font = UIFont(name: "Avenir-Light", size: 30)
            label.font = UIFont(name:"HelveticaNeue-Bold", size: 27)
            label.textColor = UIColor.black
            
            return label
        }()
        
        private let nameLabel: UILabel = {
            
            let label = UILabel()
            label.text = "User Name"
            label.font = UIFont(name: "Avenir-medium", size: 25)
            label.textColor = UIColor.black
            label.textAlignment = .center
            
            return label
        }()
        
        private let BackButton: UIButton = {
            let button = UIButton()
            // button.setTitle("Back", for: .normal)
         //   button.setBackgroundImage( imageLiteral(resourceName: "baseline_arrow_back_black_36dp"), for: .normal)
          //  button.addTarget(self, action: #selector(showSettingsController), for: UIControl.Event.touchUpInside)
            
            return button
        }()

        private let updateButton: UIButton = {
            
            let button = UIButton()
            button.backgroundColor = .white
            button.setTitle("U P D A T E", for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.titleLabel?.font = UIFont(name: "Avenir-Medium", size: 18)
          //  button.addTarget(self, action: #selector(updateOthers), for: .touchUpInside)
            
            return button
        }()
        
        private lazy var profileImageView: UIImageView = {
            
            let pImage = UIImageView()
            pImage.image = #imageLiteral(resourceName: "patient")
                //.withRenderingMode(.alwaysOriginal)
            pImage.contentMode = .scaleAspectFill
            pImage.layer.cornerRadius = 10
            pImage.clipsToBounds = true
            
            return pImage
            
        }()
        
        private let ActiveLabel: UILabel = {
            
            let label = UILabel()
            label.text = "Active user since August 2020"
            label.font = UIFont(name: "Avenir-Light", size: 15)
            label.textColor = UIColor.black
            label.textAlignment = .center
            
            return label
        }()
        
        private let addressLabel: UILabel = {
             
             let label = UILabel()
             label.text = ""
             label.font = UIFont(name: "Avenir-Light", size: 15)
             label.textColor = UIColor.black
             label.textAlignment = .center
             
             return label
         }()
        
        private let tempLabel: UILabel = {
             
             let label = UILabel()
             label.text = ""
             label.font = UIFont(name: "Avenir-Light", size: 22)
             label.textColor = UIColor.black
             label.textAlignment = .center
             
             return label
         }()
        
        private let updatePic: UIButton = {
            
            let button = UIButton()
            button.setTitle("Update Pic", for: .normal)
            button.backgroundColor = .black
            button.setTitleColor(UIColor(white: 1, alpha: 1), for: .normal)
            button.layer.cornerRadius = 5
            button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .medium)
         //   button.addTarget(self, action: #selector(updateAll), for: UIControl.Event.touchUpInside)
            
            
           return button
        }()
        
        private let fullNameTextField: UITextField = {
            
            let name = UITextField()
            name.borderStyle = .roundedRect
            name.font = UIFont.systemFont(ofSize: 16)
            name.textColor = .black
            name.keyboardAppearance = .dark
            name.isSecureTextEntry = false
            name.placeholder = "Full Name"
            name.textAlignment = .left
            
            return name
        }()
        
        private let indexTextField: UITextField = {
            
            let index = UITextField()
            index.borderStyle = .roundedRect
            index.font = UIFont.systemFont(ofSize: 16)
            index.textColor = .black
            index.keyboardAppearance = .dark
            index.isSecureTextEntry = false
            index.placeholder = "IndexNo / EmployeeCode"
            index.textAlignment = .left
            
            return index
        }()
        
        private let countryDropDown: UITextField = {
            
            let con = UITextField()
            con.borderStyle = .roundedRect
            con.font = UIFont.systemFont(ofSize: 16)
            con.textColor = .black
            con.keyboardAppearance = .dark
            con.isSecureTextEntry = false
            con.placeholder = "Country"
            con.textAlignment = .left
            
            return con
        }()
        
        private let blankView: UIView = {
            let blank = UIView()
            blank.backgroundColor = .systemGray6
            
            let separatorView = UIView()
            separatorView.backgroundColor = .lightGray
            blank.addSubview(separatorView)
            separatorView.anchor(left: blank.leftAnchor, bottom: blank.bottomAnchor, right: blank.rightAnchor, paddingLeft: 8, paddingRight: 8, height: 0.75)
            
            return blank
        }()
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
      //  self.title = "Profile"
        
        view.backgroundColor = .systemGray6
        configureNavigationBar()
LoadUI()
        // Do any additional setup after loading the view.
    }
    

    
    //MARK: - Helper
    
    func LoadUI() {
           
           view.addSubview(titleLabel)
//           titleLabel.translatesAutoresizingMaskIntoConstraints = false
//           titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//           titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        titleLabel.
           
           view.addSubview(BackButton)
         //  BackButton.anchor(top: view.safeAreaLayoutGuide.topAnchor,left: view.leftAnchor, paddingTop: 5, paddingLeft: 15, width: 30, height: 25)
           
           view.addSubview(nameLabel)
           nameLabel.anchor(top: titleLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 40)
           
           view.addSubview(profileImageView)
           profileImageView.anchor(top: nameLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 25, paddingLeft: 150, paddingRight: 150, height: 90)
           
           view.addSubview(updatePic)
           updatePic.anchor(top: profileImageView.bottomAnchor,left: view.leftAnchor, right: view.rightAnchor, paddingTop: 8, paddingLeft: 170, paddingRight: 170)
           
           view.addSubview(ActiveLabel)
           ActiveLabel.anchor(top: updatePic.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 15, paddingLeft: 90, paddingRight: 90)
           
           view.addSubview(addressLabel)
           addressLabel.anchor(top: ActiveLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 5, paddingLeft: 90, paddingRight: 90)
           
           view.addSubview(tempLabel)
           tempLabel.anchor(top: addressLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 5, paddingLeft: 90, paddingRight: 90)
           
           let stack = UIStackView(arrangedSubviews: [fullNameTextField,indexTextField,countryDropDown])
           stack.axis = .vertical
           stack.distribution = .fillEqually
           stack.spacing = 24
           
           view.addSubview(stack)
           stack.anchor(top: tempLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 40, paddingLeft: 16, paddingRight: 16)
       
           view.addSubview(updateButton)
           updateButton.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor)
           
           view.addSubview(blankView)
           blankView.anchor(top: stack.bottomAnchor, left: view.leftAnchor, bottom: updateButton.topAnchor, right: view.rightAnchor)
    }
    func configureUI(){
        
        
        
    }
    
    
    // MARK: - Navigation

    
    func configureNavigationBar() {
           navigationController?.navigationBar.isHidden = true
      //  navigationController?.navigationBar.barStyle = .default
        
       }
    
    

}
