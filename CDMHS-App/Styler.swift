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
    
    //#49b8f8
    static var mainColor = UIColor(red: (73/255), green: (184/255), blue: (248/255), alpha: 1)
    
    static var fontName = "Avenir Next"
    
    /// font used for top titles
    static var mainFont = UIFont(name: Styler.fontName, size: 22)
    
    static func styleTopBar(vc:UIViewController, title:String, backHidden:Bool) {
       vc.navigationController?.topViewController!.navigationController?.navigationBarHidden = false
       vc.navigationController?.topViewController!.title = title
       vc.navigationController?.topViewController!.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: Styler.mainFont!, NSForegroundColorAttributeName : UIColor.whiteColor()]
       
        if (backHidden == true) {
            vc.tabBarController?.navigationItem.setHidesBackButton(true, animated: false)
        } else {
            vc.tabBarController?.navigationItem.setHidesBackButton(false, animated: true)
        }
        
    }
}