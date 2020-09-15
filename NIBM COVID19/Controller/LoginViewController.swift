//
//  LoginViewController.swift
//  NIBM COVID19
//
//  Created by Mohamed Minsaf on 8/22/20.
//  Copyright © 2020 Mohamed Minsaf. All rights reserved.
//

//import UIKit

//
//  LoginViewController.swift
//  NIBM COVID19
//
//  Created by Mohamed Minsaf on 8/22/20.
//  Copyright © 2020 Mohamed Minsaf. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    //MARK: Properties
    
    let titleLabel:UILabel={
        let label = UILabel()
        label.text = "NIBM COVID19"
        label.font = UIFont(name: "Avenir-Light", size: 36)
        label.textColor = UIColor(white: 1, alpha:1 )
        
        return label
        
    }()
    
    let emailTextfield:UITextField = {

        
        return UITextField().textField(withPlaceholder: "EMAIL", isSecureTextEntry: false)
        
        
    }()
    
    let pwordtextfield:UITextField = {

        return UITextField().textField(withPlaceholder: "PASSWORD", isSecureTextEntry: true)
        
        
        
    }()
    
    
    
  private lazy var emailViewContailer: UIView = {

    
    return UIView().inputContainerView(textField: emailTextfield as! UITextField)
    
    
    }()

    
    
    private lazy var pwordViewContiner: UIView = {

        return UIView().inputContainerView(textField: pwordtextfield as! UITextField)
       }()

    
    
    private let loginButton: UIButton = {
        let logButton = UIButton(type: .system)
        logButton.setTitle("Log In", for: .normal)
        logButton.setTitleColor(UIColor(white: 1, alpha: 0.5), for: .normal)
        logButton.backgroundColor = .black
        logButton.layer.cornerRadius = 5
        logButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        logButton.addTarget(self, action: #selector(userSignIn), for: .touchUpInside)
        
        return logButton
    }()
    
    
    
    let dontHaveAccountButton: UIButton = {
        let dontHaveButton = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string: "Don't have an account?  ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        
        attributedTitle.append(NSAttributedString(string: "Sign Up", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.mainBlueTint]))
        
        dontHaveButton.setAttributedTitle(attributedTitle, for: .normal)
        dontHaveButton.addTarget(self, action: #selector(navigateToSignUP), for: .touchUpInside)
        return dontHaveButton
    }()

    
    
    
    //MARK: Lifecycle
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationBar()
        view.backgroundColor = .white
       // view.backgroundColor = UIColor.init(red: 25/255, green: 25/255, blue: 25/255, alpha: 1)
        view.addSubview(titleLabel)
        
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 40)
        titleLabel.centerX(inView: view)
        
//       view.addSubview(emailViewContailer)
//        emailViewContailer.anchor(top: titleLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 40, paddingLeft: 20,  paddingRight: 20, height: 50)
//
//        view.addSubview(pwordViewContiner)
//        pwordViewContiner.anchor(top: emailViewContailer.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20,  paddingRight: 20, height: 50)
       
        
        
        let inputStack = UIStackView(arrangedSubviews: [emailViewContailer,pwordViewContiner,loginButton])
        inputStack.axis = .vertical
        inputStack.distribution = .fillEqually
        inputStack.spacing = 20
        
        view.addSubview(inputStack)
        inputStack.anchor(top: titleLabel.bottomAnchor, left: view.leftAnchor,  right: view.rightAnchor, paddingTop: 30, paddingLeft: 20, paddingRight: 20)

        
        view.addSubview(dontHaveAccountButton)
        dontHaveAccountButton.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingLeft: 20, paddingBottom: 10, paddingRight: 20)
    }
    
    
    
    

    
    // MARK: - Navigation

    func configureNavigationBar() {
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
    }
    
    //MARK: Selector
 @objc  func navigateToSignUP(){
        let viewcontroller = SignUpViewController()
        navigationController?.pushViewController(viewcontroller, animated: true)
        
        
    }
    
    
    
    @objc func userSignIn(){
        
        guard let email = emailTextfield.text else { return }
        guard let password = pwordtextfield.text else { return }
        
        
        Auth.auth().signIn(withEmail: email, password: password){ (result, error) in
        if let error = error {
            print("DEBUG: Faild to log user with error \(error.localizedDescription)")
            return
        }
           // print("Login successfull")
            
            
//            DispatchQueue.main.async {
//                let nav = UINavigationController(rootViewController: HomeViewController())
//            //  self.present(nav, animated/Users/mohamedminsaf/Desktop/coursework/NIBM COVID19/NIBM COVID19/Controller/LoginViewController.swift: false, completion: nil)
//                self.navigationController?.pushViewController(nav, animated: true)
//            }
            let keyWindow = UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .map({$0 as? UIWindowScene})
            .compactMap({$0})
            .first?.windows
            .filter({$0.isKeyWindow}).first
            
            guard let controller = keyWindow?.rootViewController as? MainTabBarController else { return }
            controller.configureTabBar()
            self.dismiss(animated: true, completion: nil)
            
            print("DEBUG: Button clicked")
            
            
            //loginup
        
    }
    

}
}
