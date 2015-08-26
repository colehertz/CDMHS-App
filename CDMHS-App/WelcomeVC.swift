//
//  WelcomeVC.swift
//  CDMHS-App
//
//  Created by Cole H on 8/24/15.
//  Copyright (c) 2015 Yep Technologies. All rights reserved.
//

import Foundation
import UIKit

class WelcomeVC: UIViewController {
    @IBOutlet var loginBtn: UIButton!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        
        // hide the nav bar
        self.navigationController?.topViewController.navigationController?.navigationBarHidden = true
    }
    
    override func viewDidAppear(animated: Bool) {
        
    }
    
    @IBAction func loginTouch(sender: AnyObject) {
        // authenticate user through school loop
        self.performSegueWithIdentifier("mainSegue", sender: self)
        
    }
}