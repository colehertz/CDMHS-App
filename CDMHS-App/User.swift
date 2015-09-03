//
//  User.swift
//  CDMHS-App
//
//  Created by Cole H on 9/3/15.
//  Copyright (c) 2015 Yep Technologies. All rights reserved.
//

import Foundation

class User {
    private static let USER_DEFAULTS_KEY = "user"
    
    var username:String
    var password:String
    
    init (username:String, password:String) {
        self.username = username
        self.password = password
    }
    
    func save() {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setValue(self.dictionaryValue(), forKey:User.USER_DEFAULTS_KEY)
    }
    
    func dictionaryValue() -> [String:String] {
        
        let jsonObj:[String:String] = [
            "username": username,
            "password": password
        ]
        return jsonObj
    }
}