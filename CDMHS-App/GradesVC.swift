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
        
        // populate the username and password
        var usernameJS = "var inputFields = document.querySelectorAll(\"input[type='text']\"); for (var i = inputFields.length >>> 0; i--;) { inputFields[i].value = '\(username)';}"
        var passwordJS = "var passFields = document.querySelectorAll(\"input[type='password']\"); for (var i = passFields.length>>> 0; i--;) { passFields[i].value ='\(password)';}"
        let submitJS = "document.form.event_override.value='login';document.form.submit();"
        
        self.webView.stringByEvaluatingJavaScriptFromString(usernameJS)
        self.webView.stringByEvaluatingJavaScriptFromString(passwordJS)
        self.webView.stringByEvaluatingJavaScriptFromString(submitJS)
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

