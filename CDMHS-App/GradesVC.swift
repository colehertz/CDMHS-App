//
//  SecondViewController.swift
//  CDMHS-App
//
//  Created by Cole H on 8/24/15.
//  Copyright (c) 2015 Yep Technologies. All rights reserved.
//

import UIKit

class GradesVC: UIViewController, UIWebViewDelegate, UIAlertViewDelegate {
    @IBOutlet var webView: UIWebView!
    let alert = LoginAlert()
    var loadCount = 0;
    var mayAttempt = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        alert.delegate = self
        
        Styler.styleTopBar(self, title: "GRADES", backHidden: true)
        
        let url = NSURL(string: "https://cdm.schoolloop.com/mobile/login")
        self.webView.loadRequest(NSURLRequest(URL: url!))
        self.webView.delegate = self
        
        loadCount = 0;
    }
    
    override func viewWillAppear(animated: Bool) {
        

    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        print("loaded")
        if (mayAttempt == true) {
            loadCount++
            
            let username = User.get().username
            let password = User.get().password
            
            // populate the username and password
            let usernameJS = "var inputFields = document.querySelectorAll(\"input[type='text']\"); for (var i = inputFields.length >>> 0; i--;) { inputFields[i].value = '\(username)';}"
            let passwordJS = "var passFields = document.querySelectorAll(\"input[type='password']\"); for (var i = passFields.length>>> 0; i--;) { passFields[i].value ='\(password)';}"
            let submitJS = "document.form.event_override.value='login';document.form.submit();"
            
            self.webView.stringByEvaluatingJavaScriptFromString(usernameJS)
            self.webView.stringByEvaluatingJavaScriptFromString(passwordJS)
            self.webView.stringByEvaluatingJavaScriptFromString(submitJS)
            
            if (self.webView.request!.URLString.containsString("donotupdate=true") && loadCount > 1) {
                print("login failed")
                mayAttempt = false
                alert.show()
            }
        }
        
        if (self.webView.request!.URLString.containsString("mobile") == false) {
            self.webView.loadRequest(NSURLRequest(URL: NSURL(string: "https://cdm.schoolloop.com/mobile/index")!))
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        if buttonIndex != alertView.cancelButtonIndex {
            
            UserService.signIn(alertView.textFieldAtIndex(0)!.text!, password:alertView.textFieldAtIndex(1)!.text!,
                successFunc: { (user) -> Void in
                    // save the user credentials if the login works for school loop
                    user.save()
                    self.mayAttempt = true
                    self.webView.reload()
                }, errorFunc: {(error, response) -> Void in
                    print("sign In error:\(error)")
                }, badParams: {(params) -> Void in
                    
            })
            
            
        }
    }


}

