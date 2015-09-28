//
//  LoginAlert.swift
//  CDMHS-App
//
//  Created by Cole H on 9/27/15.
//  Copyright © 2015 Yep Technologies. All rights reserved.
//

import Foundation
import UIKit

class LoginAlert: UIAlertView {
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.title = "Login"
        self.addButtonWithTitle("Sign In")
        self.alertViewStyle = UIAlertViewStyle.LoginAndPasswordInput
        self.addButtonWithTitle("Cancel")
        
    }
}