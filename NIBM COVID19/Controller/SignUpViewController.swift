//
//  SignUpViewController.swift
//  NIBM COVID19
//
//  Created by Mohamed Minsaf on 8/24/20.
//  Copyright © 2020 Mohamed Minsaf. All rights reserved.
//

import UIKit
import Firebase
import GeoFire
import FirebaseAuth
import FirebaseDatabase


class SignUpViewController: UIViewController {

    //MARK: - Properties
    
    private var location = LocationHandler.shared.locationManager.location
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign up for NIBM COVID19"
        label.font = UIFont(name: "Avenir-Light", size: 20)
        label.textColor = UIColor(white: 1, alpha: 0.8)
        
        
        return label
    }()
    
    
    
    
    private let nameTextField :UITextField = {
        
        return UITextField().textField(withPlaceholder: "FUll NAME", isSecureTextEntry: false)
        
    }()
    
    private let addressTextField :UITextField = {
        
        return UITextField().textField(withPlaceholder: "ADDRESS", isSecureTextEntry: false)
        
    }()
    
    private let idTextField :UITextField = {
        
        return UITextField().textField(withPlaceholder: "ID", isSecureTextEntry: false)
        
    }()
    
    private let emailTextField: UITextField = {
        
        return UITextField().textField(withPlaceholder: "EMAIL", isSecureTextEntry: false)
        
    }()
    
    private let pwordTextField : UITextField = {
        return UITextField().textField(withPlaceholder: "PASWORD", isSecureTextEntry: true)
        
    }()
    
    
    
    private lazy var nameViewContainer: UIView = {
        
        
        return UIView().inputContainerView(textField: nameTextField as UITextField)
        
    }()
    
    private lazy var addressViewContainer: UIView = {
        
        
        return UIView().inputContainerView(textField: addressTextField as UITextField)
        
    }()
    
    private lazy var idViewContainer: UIView = {
        
        
        return UIView().inputContainerView(textField: idTextField as UITextField)
        
    }()
    
    private lazy var emailViewContainer :UIView = {
        return UIView().inputContainerView(textField: emailTextField as UITextField)
    }()
    
    private lazy var pwordViewCOntainer:UIView = {
        return UIView().inputContainerView(textField: pwordTextField as UITextField)
    }()
    
    
    
    private let accountTypeSegmentedControl: UISegmentedControl = {
        let accountType = UISegmentedControl(items: ["Student", "Lecturer","Staff"])
        accountType.backgroundColor = .backgroundColor
        accountType.tintColor = UIColor(white: 1, alpha: 0.87)
        accountType.selectedSegmentIndex = 0
        
        return accountType
    }()
    
    
    private let signUpButton: CustomAuthButtonUI = {
        let SignButton = CustomAuthButtonUI(type: .system)
        SignButton.setTitle("Sign Up", for: .normal)
        SignButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        SignButton.backgroundColor = .black
        SignButton.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        
        return SignButton
    }()
    
    
    
    let alreadyHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string: "Already have an account?  ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        
        attributedTitle.append(NSAttributedString(string: "Log In", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.mainBlueTint]))
        
     button.addTarget(self, action: #selector(handleShowLogIn), for: .touchUpInside)
        
        button.setAttributedTitle(attributedTitle, for: .normal)
        return button
    }()
    
    
    
    
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
       configureNavigationBar()
        view.backgroundColor = .white
        
        
        view.addSubview(titleLabel)
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 10, paddingLeft: 20,  paddingRight:20)
        titleLabel.centerX(inView: view)
        
        
        let inputStack = UIStackView(arrangedSubviews: [nameViewContainer,addressViewContainer,idViewContainer,emailViewContainer,pwordViewCOntainer,accountTypeSegmentedControl,signUpButton])
        inputStack.axis = .vertical
        inputStack.distribution = .fillEqually
        inputStack.spacing = 20
        
        view.addSubview(inputStack)
        inputStack.anchor(top: titleLabel.bottomAnchor,  paddingTop: 20, width: 300)
        inputStack.centerX(inView: view)
        
        
        view.addSubview(alreadyHaveAccountButton)
            alreadyHaveAccountButton.centerX(inView: view)
            alreadyHaveAccountButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, height: 32)
            
        }
    
    
    // MARK: - Navigation
    
    func configureNavigationBar() {
           navigationController?.navigationBar.isHidden = true
           //navigationController?.navigationBar.barStyle = .black
       }
    
    func uploadUserDataAndShowHomeController(uid: String, values: [String: Any]) {
        
        REF_USERS.child(uid).updateChildValues(values) //{ (error, ref) in
            //handle error
            //print("user here!")
//            let keyWindow = UIApplication.shared.connectedScenes
//            .filter({$0.activationState == .foregroundActive})
//            .map({$0 as? UIWindowScene})
//            .compactMap({$0})
//            .first?.windows
//            .filter({$0.isKeyWindow}).first
//
//            guard let controller = keyWindow?.rootViewController as? MainTabBarController else { return }
//            controller.configureTabBar()
            print("Account created")
            self.dismiss(animated: true, completion: nil)
    }
    
//    func uploadUserDataAndDismissView(uid: String, values: [String: Any]) {
//          print("location4")
//          REF_USERS.child(uid).updateChildValues(values) { (error, ref) in
//           print("SUCCESS")
//              self.dismiss(animated: true, completion: nil)
//          }
//      }
    
    // MARK: - Selectors
       
       
    
    
    @objc func handleSignUp() {
        
           guard let fullName = nameTextField.text else { return }
           guard let address = addressTextField.text else { return }
           guard let index = idTextField.text else { return }
           guard let email = emailTextField.text else { return }
           guard let password = pwordTextField.text else { return }
        let accountType = accountTypeSegmentedControl.selectedSegmentIndex
        
           
           Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
               if let error = error {
                   print("Faild to signup user with error \(error)")
                   return
               }
               
            guard let uid = result?.user.uid else { return }
            
               let values = [
                   "fullName": fullName,
                   "address": address,
                   "email": email,
                   "index": index,
                   "accountType" : accountType
               ] as [String : Any]
            
//            if accountType == 0 || accountType == 1 {
//
//

               let geoFire = GeoFire(firebaseRef: REF_USER_LOCATIONS)

               guard let location = self.location else { return }
                   print(location)
            
               geoFire.setLocation(location, forKey: uid, withCompletionBlock: { (error) in
                   self.uploadUserDataAndShowHomeController(uid: uid, values: values)
               })
           
               self.uploadUserDataAndShowHomeController(uid: uid, values: values)
           }
       }
    
    
    @objc func handleShowLogIn() {
     
    // let vc = LoginViewController()
    // navigationController?.pushViewController(vc, animated: true)
        navigationController?.popViewController(animated: true)
    }
    

}
    
    



