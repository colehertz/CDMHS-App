//
//  User.swift
//  CDMHS-App
//
//  Created by Cole H on 9/3/15.
//  Copyright (c) 2015 Yep Technologies. All rights reserved.
//

import Foundation
import RealmSwift

class User: Object {
    private static let USER_DEFAULTS_KEY = "user"
    
    dynamic var username:String = ""
    dynamic var password:String = ""
    dynamic var id = Int(arc4random())
    
    static func initUser (username:String, password:String) -> User {
        let user = User()
        user.username = username
        user.password = password
        return user
    }

    
    static func get() -> User {
        // Get default store
        let defaults = NSUserDefaults.standardUserDefaults()
        // Try to get stored user json from the store
        if let storedDic = defaults.dictionaryForKey(User.USER_DEFAULTS_KEY) {
            // Try to parse the stored user json into a User object
            let user = User.fromDictionary(storedDic)
            // Return the parsed user object
            return user
        }
        // Return a blank user object
        return User()
    }
    
    func saveToRealm() {
        print(Realm.Configuration.defaultConfiguration)
        
        do {
            let realm = try Realm()
            realm.write {
                realm.add(self, update: true)
            }
        } catch {
            print("realm error")
        }
        
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
    
    static func fromDictionary(storedDic:[NSObject:AnyObject]) -> User{
        var username = storedDic["username"] as! String
        var password = storedDic["password"] as! String
        var user = User.initUser(username, password: password)
        
        return user
    }
    
    // set the primary key to the id
    override class func primaryKey() -> String {
        return "id"
    }
}