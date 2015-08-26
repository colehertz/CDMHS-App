//
//  Styler.swift
//  CDMHS-App
//
//  Created by Cole H on 8/26/15.
//  Copyright (c) 2015 Yep Technologies. All rights reserved.
//

import Foundation
import UIKit

class Styler {
    
    static var fontName = "Avenir Next"
    
    /// font used for top titles
    static var mainFont = UIFont(name: Styler.fontName, size: 22)
    
    static func styleTopBar(vc:UIViewController, title:String, backHidden:Bool) {
       vc.navigationController?.topViewController.navigationController?.navigationBarHidden = false
       vc.navigationController?.topViewController.title = title
       vc.navigationController?.topViewController.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: Styler.mainFont!]
       
        if (backHidden == true) {
            vc.navigationController?.topViewController.navigationController?.navigationItem.setHidesBackButton(true, animated: false)
        } else {
            vc.navigationController?.topViewController.navigationController?.navigationItem.setHidesBackButton(false, animated: false)
        }
        
    }
}