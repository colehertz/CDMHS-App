//
//  UserService.swift
//  CDMHS-App
//
//  Created by Cole H on 9/3/15.
//  Copyright (c) 2015 Yep Technologies. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class UserService {
    
    static func signIn(username:String, password:String, successFunc:(User)-> Void, errorFunc:(NSError!, NSHTTPURLResponse?) -> Void, badParams:([String])->Void) {
        
        Alamofire.request(.POST, "\(Api.baseUrl)/signIn/", parameters:["username":username, "password":password])
            .response { request, response, data, error in
                var json = JSON(data:data!)
                
                if (error == nil) {
                    if let username = json["username"].string, password = json["password"].string {
                        successFunc(User(username: username, password: password))
                    } else {
                        // bad parameters handler here
                    }
                } else {
                    errorFunc(error, response)
                }
            }
    }
    
    
}