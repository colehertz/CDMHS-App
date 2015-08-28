//
//  SocialMediaView.swift
//  CDMHS-App
//
//  Created by Cole H on 8/27/15.
//  Copyright (c) 2015 Yep Technologies. All rights reserved.
//

import Foundation
import UIKit

class SocialMediaView: UIViewController {
    
    @IBOutlet var webView: UIWebView!
    var socialMediaObj:SocialMediaOption!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.webView.loadRequest(NSURLRequest(URL: socialMediaObj.url))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}