//
//  SignUpViewController.swift
//  NIBM COVID19
//
//  Created by Mohamed Minsaf on 8/24/20.
//  Copyright © 2020 Mohamed Minsaf. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    //MARK: - Properties
    
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
    
    private let emailTextField: UITextField = {
        
        return UITextField().textField(withPlaceholder: "EMAIL", isSecureTextEntry: false)
        
    }()
    
    private let pwordTextField : UITextField = {
        return UITextField().textField(withPlaceholder: "PASWORD", isSecureTextEntry: true)
        
    }()
    
    
    
    private lazy var nameViewContainer: UIView = {
        
        
        return UIView().inputContainerView(textField: nameTextField as UITextField)
        
    }()
    
    private lazy var emailViewContainer :UIView = {
        return UIView().inputContainerView(textField: emailTextField as UITextField)
    }()
    
    private lazy var pwordViewCOntainer:UIView = {
        return UIView().inputContainerView(textField: pwordTextField as UITextField)
    }()
    
    
    
    
    
    
    
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        
        view.addSubview(titleLabel)
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 80, paddingLeft: 20,  paddingRight:20)
        
        
        let inputStack = UIStackView(arrangedSubviews: [nameViewContainer,emailViewContainer,pwordViewCOntainer])
        inputStack.axis = .vertical
        inputStack.distribution = .fillEqually
        inputStack.spacing = 20
        
        view.addSubview(inputStack)
        inputStack.anchor(top: titleLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 50, paddingLeft: 20,  paddingRight: 20)

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
