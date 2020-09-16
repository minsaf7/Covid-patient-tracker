//
//  User.swift
//  NIBM COVID19
//
//  Created by Mohamed Minsaf on 9/16/20.
//  Copyright © 2020 Mohamed Minsaf. All rights reserved.
//

import CoreLocation

struct User {
    let firstName: String
    let lastName: String
    let email: String
    let role: String
    var location: CLLocation?
    let uid: String
    var result: Int?
    
    init(uid: String, dictionary: [String: Any]) {
        self.uid = uid
        self.firstName = dictionary["firstName"] as? String ?? ""
        self.lastName = dictionary["lastName"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.role = dictionary["role"] as? String ?? ""
    }
}
