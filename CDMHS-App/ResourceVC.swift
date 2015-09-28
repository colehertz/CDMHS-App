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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        Styler.styleTopBar(self, title: resource.title, backHidden: false)
        let backBtn = BackBtn(vc: self)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        self.webView.loadRequest(NSURLRequest(URL: resource.url!))
    }
}