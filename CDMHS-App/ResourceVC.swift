//
//  ResourceVC.swift
//  CDMHS-App
//
//  Created by Cole H on 9/5/15.
//  Copyright (c) 2015 Yep Technologies. All rights reserved.
//

import Foundation
import UIKit

class ResourceVC: UIViewController {
    @IBOutlet var webView: UIWebView!
    var resource = Resource()
    var backButton:BackBtn!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.webView.scalesPageToFit = true
        
        self.navigationController?.topViewController.title = resource.title
        backButton = BackBtn(vc: self)
    }
    
    override func viewWillAppear(animated: Bool) {
       
    }
    
    override func viewDidAppear(animated: Bool) {
        self.webView.loadRequest(NSURLRequest(URL: resource.url!))
    }
}