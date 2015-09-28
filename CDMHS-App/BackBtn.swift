//
//  BackButton.swift
//  Together
//
//  Created by Cole H on 7/21/15.
//  Copyright (c) 2015 AMP Element. All rights reserved.
//

import Foundation
import UIKit

class BackBtn: UIBarButtonItem {
    var viewController:UIViewController!
    
    init (vc:UIViewController) {
        super.init()
        
        self.viewController = vc
        
        let backImg = UIImage(named:"backBtn.png")
        let backView = UIImageView(frame: CGRectMake(0, 0, 35, 35))
        backView.contentMode = UIViewContentMode.ScaleAspectFit
        backView.image = backImg
        let backButton = UIButton(frame: CGRectMake(0, 0, 35, 35));
        backButton.addSubview(backView)
        backButton.addTarget(self, action: "backPressed", forControlEvents: UIControlEvents.TouchDown)
        let backButtonItem = UIBarButtonItem(customView:backButton)
        viewController.navigationController?.navigationBar.backItem?.backBarButtonItem?.setBackgroundImage(backImg, forState: UIControlState.Normal, barMetrics: UIBarMetrics.Default)
        viewController.navigationController?.topViewController?.navigationItem.setLeftBarButtonItem(self, animated: false)
        
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func backPressed() {
        viewController.navigationController?.popViewControllerAnimated(true)
    }
}