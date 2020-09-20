//
//  NotificTableViewViewController.swift
//  NIBM COVID19
//
//  Created by Mohamed Minsaf on 9/18/20.
//  Copyright © 2020 Mohamed Minsaf. All rights reserved.
//



import UIKit
import Firebase
import FirebaseDatabase
import FirebaseCore

class NotificTableViewViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    //MARK: - Properties
    
    
    var tableView: UITableView!
        var allNotifics =  [String]()
    
    
    private let titleLabel: UILabel = {
          
          let label = UILabel()
          label.text = "All"
          //label.font = UIFont(name: "Avenir-Light", size: 30)
          label.font = UIFont(name:"HelveticaNeue-Bold", size: 27)
          label.textColor = UIColor.black
          
          return label
      }()
      
    private let backButton: UIButton = {
           let button = UIButton(type: .custom)
           let boldConfig = UIImage.SymbolConfiguration(pointSize: .zero, weight: .bold, scale: .large)
           button.setImage(UIImage(systemName: "chevron.left", withConfiguration: boldConfig), for: .normal)
           button.tintColor = .black
          button.addTarget(self, action: #selector(navBack), for: .touchUpInside)
           return button
       }()
      
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        view.backgroundColor = .systemGray6
        
        
        Database.database().reference().child("nibm-notifications").observe(.value, with: { (snapshot) in
                   
                   for child in snapshot.children.allObjects as! [DataSnapshot] {
                       let dict = child.value as? [String : AnyObject] ?? [:]
                       self.allNotifics.append(dict["notifications"] as! String)
                       
                       self.setTableView()
                   }
               })
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allNotifics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath)
        cell.textLabel?.text = allNotifics[indexPath.row]
        return cell
    }
    
    
    @objc func navBack(){
           navigationController?.popViewController(animated: true)
       }
    
    // MARK: - Navigation
    func configureNavigationBar() {
        navigationController?.navigationBar.isHidden = true
       // navigationController?.navigationBar.barStyle = .black
    }
    
    func setTableView() {
        
        
        
        tableView = UITableView(frame: view.frame)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "NewsCell")
        view.addSubview(tableView)
        
        
        view.addSubview(backButton)
        backButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, paddingTop: 20, paddingLeft: 16, height: 38, width: 38)
        
        view.addSubview(titleLabel)
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 20)
        titleLabel.centerX(inView: view)
        
        tableView.anchor(top: titleLabel.bottomAnchor, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingTop: 20)
        
    }

}
