//
//  HomeViewController.swift
//  NIBM COVID19
//
//  Created by Mohamed Minsaf on 8/25/20.
//  Copyright © 2020 Mohamed Minsaf. All rights reserved.
//

import UIKit
import Firebase
import MapKit


private let reuseIdentifier = "LocationCell"
private let annotationIdentifier = "UserAnnotation"


class HomeViewController: UIViewController {


    //MARK: Properties

    private let userMap = MKMapView()
   // private let locationManager = CLLocationManager()
    private let inputActivationUIView = LocationInputUIView()
     private let locationManager = LocationHandler.shared.locationManager
    private var route: MKRoute?

    
    
    private let topViewContainer: UIView = {
           let containerView = UIView()
           containerView.backgroundColor = .white
           
           let iconImage = UIImageView()
           iconImage.image = UIImage(named: "facemask")
           containerView.addSubview(iconImage)
           iconImage.anchor(left: containerView.leftAnchor, paddingLeft: 36,  height: 125,width: 125)
           iconImage.centerY(inView: containerView)
           
           let topText = UILabel()
           topText.text = "All you need is"
           topText.font = UIFont(name: "Avenir-Medium", size: 26)
           containerView.addSubview(topText)
           topText.anchor(top: iconImage.topAnchor, left: iconImage.rightAnchor, paddingLeft: 34)
           
           let subTitle = UILabel()
           subTitle.text = "stay at home"
           subTitle.font = UIFont(name: "Avenir-Black", size: 30)
           containerView.addSubview(subTitle)
           subTitle.anchor(top: topText.bottomAnchor, left: iconImage.rightAnchor, paddingLeft: 34)
           
           let safeActions = UIButton()
           let imgConfig = UIImage.SymbolConfiguration(pointSize: 0, weight: .medium, scale: .small)
           safeActions.setTitle("Safe Actions ", for: .normal)
           safeActions.setTitleColor(.darkGray, for: .normal)
           safeActions.setImage(UIImage(systemName: "chevron.left", withConfiguration: imgConfig), for: .normal)
           safeActions.tintColor = .darkGray
           safeActions.titleLabel?.font = UIFont.systemFont(ofSize: 14)
           safeActions.semanticContentAttribute = .forceRightToLeft
           safeActions.sizeToFit()
         //  safeActions.addTarget(self, action: #selector(showSafeActions), for: .touchUpInside)
           containerView.addSubview(safeActions)
           safeActions.anchor(top: subTitle.bottomAnchor, left: iconImage.rightAnchor, paddingTop: 15, paddingLeft: 34)
           
           return containerView
       }()
       






    override func viewDidLoad() {
        super.viewDidLoad()

    // checkIsUserLoggedIn()
      //  signOut()
configureUI()
    }



    // MARK: - Configuring UI

    func configureUI(){
         configureNavigationBar()
        view.backgroundColor = .systemGray6
               view.addSubview(topViewContainer)
        topViewContainer.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, height: 30 * view.bounds.height/100)
        
        
//        setMap()
//        view.addSubview(inputActivationUIView)
//        inputActivationUIView.centerX(inView: view)
//        inputActivationUIView.setDimensions(height: 50, width: view.frame.width - 64)
//        inputActivationUIView.anchor(top: view.safeAreaLayoutGuide.topAnchor,paddingTop: 20)
//
//        inputActivationUIView.alpha = 0
//
//        UIView.animate(withDuration: 2) {
//            self.inputActivationUIView.alpha = 1
//        }


    }


    func setMap(){

        view.addSubview(userMap)
               userMap.frame = view.frame

        userMap.showsUserLocation = true
        userMap.userTrackingMode = .follow
    }

    // MARK: - Navigation

    func configureNavigationBar() {
           navigationController?.navigationBar.isHidden = true
          // navigationController?.navigationBar.barStyle = .black
       }


    // MARK: - Selectors





    func checkIsUserLoggedIn() {
                   if(Auth.auth().currentUser?.uid == nil) {

//                       DispatchQueue.main.async {
//                            let nav = UINavigationController(rootViewController: LoginViewController())
//                           self.present(nav, animated: true, completion: nil)
//
//
//                           self.dismiss(animated: true, completion: nil)
//                       }
                    DispatchQueue.main.async {
                                   let nav = UINavigationController(rootViewController: LoginViewController())
                                   nav.modalPresentationStyle = .fullScreen
                                   self.present(nav, animated: true, completion: nil)
                               }





                   } else {
                       print("DEBUG: User is logged in..")
                    // setMap()
                    configureUI()

                   }
               }





    func signOut() {
                  do {
                      try Auth.auth().signOut()
                  } catch {
                      print("DEBUG: sign out error")
                  }
              }









    }

//MARK: - Location services


//extension HomeViewController {
//
//    func enableLocationServices() {
//        switch CLLocationManager.authorizationStatus() {
//        case .notDetermined:
//            locationManager?.requestWhenInUseAuthorization()
//        case .restricted, .denied:
//            break
//        case .authorizedWhenInUse:
//            locationManager?.requestAlwaysAuthorization()
//        case .authorizedAlways:
//            locationManager?.startUpdatingLocation()
//            locationManager?.desiredAccuracy = kCLLocationAccuracyBest
//        default:
//            break
//        }
//    }
//}



//extension HomeViewController : CLLocationManagerDelegate{
//    func enableLocationServices(){
//
//        locationManager.delegate = self
//
//        switch CLLocationManager.authorizationStatus() {
//        case .notDetermined:
//            locationManager.requestWhenInUseAuthorization()
//            print("Not determined")
//       case .restricted, .denied:
//            break
//        case .authorizedWhenInUse:
//            locationManager.requestAlwaysAuthorization()
//            print("DEBUG: authorized When In Use")
//        case .authorizedAlways:
//            locationManager.startUpdatingLocation()
//            locationManager.desiredAccuracy = kCLLocationAccuracyBest
//            print("DEBUG: authorized Always")
//        default:
//            break
//        }
//
//    }
//
//    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
//        if status == .authorizedWhenInUse {
//            locationManager.requestAlwaysAuthorization()
//        }
//
//    }
//
//
//
//}
//






// new

