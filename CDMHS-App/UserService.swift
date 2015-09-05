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
        
        let parameters = [
            "username": username,
            "password": password
        ]
        
        Alamofire.request(.POST, "\(Api.baseUrl)/validLogin/", parameters:parameters, encoding:.JSON)
            .response { request, response, data, error in
                println(response)
                var json = JSON(data:data!)
                if (error == nil) {
                    if let validLogin = json["result"].bool {
                        if (validLogin == true) {
                            var user = User.initUser(username, password: password)
                            successFunc(user)
                        }
                    } else {
                        // bad parameters handler here
                    }
                } else {
                    errorFunc(error, response)
                }
            }
    }
    
    
}