//
//  SecondViewController.swift
//  CDMHS-App
//
//  Created by Cole H on 8/24/15.
//  Copyright (c) 2015 Yep Technologies. All rights reserved.
//

import UIKit

class GradesVC: UIViewController, UIWebViewDelegate {
    @IBOutlet var webView: UIWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        
        Styler.styleTopBar(self, title: "GRADES", backHidden: true)
        
        var url = NSURL(string: "https://cdm.schoolloop.com/portal/login?d=x&return_url=1441319901658")
        self.webView.loadRequest(NSURLRequest(URL: url!))
        self.webView.delegate = self
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        
        var username = User.get().username
        var password = User.get().password
        
        var usernameJS = "var inputFields = document.querySelectorAll(\"input[type='text']\"); for (var i = inputFields.lenght >>> 0; i--;) { inputFields[i].value = '\(username)';}"
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

