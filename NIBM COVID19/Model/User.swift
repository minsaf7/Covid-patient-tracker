//
//  User.swift
//  NIBM COVID19
//
//  Created by Mohamed Minsaf on 9/16/20.
//  Copyright © 2020 Mohamed Minsaf. All rights reserved.
//

import CoreLocation

enum AccountType: Int {
    case Student
    case Staff
}


   struct User {
        let fullName: String
        let address: String
        let email: String
        //let role: String
        var location: CLLocation?
        let uid: String
//        let temperature: String
//        var result: Int?
        
        init(uid: String, dictionary: [String: Any]) {
            self.uid = uid
            self.fullName = dictionary["firstName"] as? String ?? ""
            self.address = dictionary["lastName"] as? String ?? ""
            self.email = dictionary["email"] as? String ?? ""
         //   self.role = dictionary["role"] as? String ?? ""
//            self.temperature = dictionary["temperature"] as? String ?? "0"
//            self.result = dictionary["score"] as? Int ?? 0
        }
    }
