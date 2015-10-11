//
//  WelcomeVC.swift
//  CDMHS-App
//
//  Created by Cole H on 8/24/15.
//  Copyright (c) 2015 Yep Technologies. All rights reserved.
//

import Foundation
import UIKit

class WelcomeVC: UIViewController, UIAlertViewDelegate {
    @IBOutlet var loginBtn: UIButton!
    var alert = LoginAlert()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        alert.delegate = self
    
    }
    
    override func viewWillAppear(animated: Bool) {

        // hide the nav bar
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
        self.navigationController?.navigationBar.barTintColor = Styler.mainColor
        self.navigationController?.topViewController!.navigationController?.navigationBarHidden = true
        
        let user = User.get()
        if user.username != "" {
            // user is logged in so segue
            self.performSegueWithIdentifier("mainSegue", sender: self)
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        
    }
    
    @IBAction func loginTouch(sender: AnyObject) {
        // authenticate user through school loop
        alert.show()
        
    }
    
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        if buttonIndex != alertView.cancelButtonIndex {
            
            UserService.signIn(alertView.textFieldAtIndex(0)!.text!, password:alertView.textFieldAtIndex(1)!.text!,
                successFunc: { (user) -> Void in
                    // save the user credentials if the login works for school loop
                    user.save()
                    self.performSegueWithIdentifier("mainSegue", sender: self)
                }, errorFunc: {(error, response) -> Void in
                    print("sign In error:\(error)")
                }, badParams: {(params) -> Void in
            
            })
            
            
        }
    }
}