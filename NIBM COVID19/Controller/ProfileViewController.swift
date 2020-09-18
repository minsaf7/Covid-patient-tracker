//
//  ProfileViewController.swift
//  NIBM COVID19
//
//  Created by Mohamed Minsaf on 9/15/20.
//  Copyright © 2020 Mohamed Minsaf. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseCore
import FirebaseDatabase
import FirebaseStorage

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
            button.addTarget(self, action: #selector(updateOthers), for: .touchUpInside)
            
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
            button.addTarget(self, action: #selector(updateAll), for: UIControl.Event.touchUpInside)
            
            
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
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 5)
        titleLabel.centerX(inView: view)
           
       //    view.addSubview(BackButton)
         //  BackButton.anchor(top: view.safeAreaLayoutGuide.topAnchor,left: view.leftAnchor, paddingTop: 5, paddingLeft: 15, width: 30, height: 25)
           
           view.addSubview(nameLabel)
           nameLabel.anchor(top: titleLabel.bottomAnchor, paddingTop: 40)
        nameLabel.centerX(inView: view)
           
           view.addSubview(profileImageView)
           profileImageView.anchor(top: nameLabel.bottomAnchor, paddingTop: 25, height: 90,width: 90)
        profileImageView.centerX(inView: view)
           
           view.addSubview(updatePic)
           updatePic.anchor(top: profileImageView.bottomAnchor, paddingTop: 8)
        updatePic.centerX(inView: view)
           
           view.addSubview(ActiveLabel)
           ActiveLabel.anchor(top: updatePic.bottomAnchor,  paddingTop: 15)
        ActiveLabel.centerX(inView: view)
           
           view.addSubview(addressLabel)
           addressLabel.anchor(top: ActiveLabel.bottomAnchor,paddingTop: 5)
        addressLabel.centerX(inView: view)
           
           view.addSubview(tempLabel)
           tempLabel.anchor(top: addressLabel.bottomAnchor, paddingTop: 5)
        tempLabel.centerX(inView: view)
           
           let stack = UIStackView(arrangedSubviews: [fullNameTextField,indexTextField,countryDropDown])
           stack.axis = .vertical
           stack.distribution = .fillEqually
           stack.spacing = 24
           
           view.addSubview(stack)
           stack.anchor(top: tempLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 40, paddingLeft: 16, paddingRight: 14)
       
           view.addSubview(updateButton)
         //  updateButton.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor)
        updateButton.anchor(top: stack.bottomAnchor, paddingTop: 10)
        updateButton.centerX(inView: view)
           
        
        
        //fetch user details
        let userID = Auth.auth().currentUser?.uid
            Database.database().reference().child("users").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
                // Get user details
                let value = snapshot.value as? NSDictionary
                let name = value?["fullName"] as? String ?? ""
                let address = value?["address"] as? String ?? ""
                let temparature = value?["bodyTemp"] as? Int ?? 0
                let profilePic = value?["profilePicURL"] as? String ?? ""
                let index = value?["index"] as? String ?? ""
                let country = value?["address"] as? String ?? ""
                
                let temp = String(temparature)
                
                self.nameLabel.text = name
                self.addressLabel.text = "at \(address)"
                self.tempLabel.text = temp+"'C"
                self.fullNameTextField.text = name
                self.indexTextField.text = index
                self.countryDropDown.text = country
                
              
                let imageUrl = URL(string: profilePic)
                
                if imageUrl == nil
                {
                    self.profileImageView.image =  #imageLiteral(resourceName: "patient")
                }
                else {
                
                let imageData = try! Data(contentsOf: imageUrl!)
                let image = UIImage(data: imageData)
                
                self.profileImageView.image = image!
                
                }
                // ...
            }) { (error) in
                print("Name not found")
            }
        }
        
        
    func uploadProfilePic() {
       
           let tapGuesture = UITapGestureRecognizer(target: self, action: #selector(ProfileViewController.handleSelectProfileImageView))
           profileImageView.addGestureRecognizer(tapGuesture)
           profileImageView.isUserInteractionEnabled = true
       }

       @objc func showSettingsController() {
           let set = SettingViewController()
           set.modalPresentationStyle = .fullScreen
           present(set, animated: true, completion: {
               // Back
           })
       }

    @objc func updateAll() {
           
           let userID = Auth.auth().currentUser?.uid
           
           let storageRef = Storage.storage().reference(forURL:"gs://nibm-covid19-4052c.appspot.com/displayPictures").child(userID!).child("\(NSUUID().uuidString).jpg")
           
           if let profileImg = self.selectedImage, let imageData = profileImg.jpegData(compressionQuality: 0.1){
               storageRef.putData(imageData, metadata: nil, completion: { (metadata, error ) in
                   
                   if error != nil{
                       print("Error in uploading profile photo.")
                   }

                   storageRef.downloadURL(completion: {(url, error) in
                       if error != nil {
                           print(error!.localizedDescription)
                           return
                       }
                       else if url == nil{
                           print(error!.localizedDescription)
                           return
                       }
                       
                       let pic = url?.absoluteString
       
                       let userdata = ["profilePicURL": pic as Any,]
                       Database.database().reference().child("users").child((userID)!).updateChildValues(userdata) { (error, ref) in
                       
                           let ac = UIAlertController(title: "Profile Pic", message: "Successfully updated", preferredStyle: .alert)
                           ac.addAction(UIAlertAction(title: "OK", style: .default))
                           self.present(ac, animated: true)
                       }
                       
                   })
               }
               )}
       }

    
    @objc func updateOthers() {
       
           guard let userID = Auth.auth().currentUser?.uid else { return }
           
           guard let name = fullNameTextField.text else { return }
           guard let index = indexTextField.text else { return }
           guard let country = countryDropDown.text else { return }
           
           let values = [
               "fullName": name,
               "indexOrEmployeeCode": index,
               "country": country
               ] as [String : Any]
           
           Database.database().reference().child("users").child(userID).updateChildValues(values) { (error, ref) in
               
               let ac = UIAlertController(title: "Fields update", message: "Successfully updated", preferredStyle: .alert)
               ac.addAction(UIAlertAction(title: "OK", style: .default))
               self.present(ac, animated: true)
               
           }
       }

    
    @objc func handleSelectProfileImageView(){
           let pickerController = UIImagePickerController()
           pickerController.delegate = self
           present(pickerController, animated: true, completion: nil)
       }
    
    
    
    // MARK: - Navigation

    
    func configureNavigationBar() {
           navigationController?.navigationBar.isHidden = true
      //  navigationController?.navigationBar.barStyle = .default
        
       }
    
    

}


extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[.originalImage] as? UIImage {
            selectedImage = image
            profileImageView.image = image
        }
        print(info)
        
        dismiss(animated: true, completion: nil)
    }
}

