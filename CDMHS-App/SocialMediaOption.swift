//
//  SocialMediaOption.swift
//  CDMHS-App
//
//  Created by Cole H on 8/27/15.
//  Copyright (c) 2015 Yep Technologies. All rights reserved.
//

import Foundation
import UIKit

class SocialMediaOption {

    var logoImage:UIImage!
    var networkName: String!
    var url:NSURL!
    
    init(name:String, logo:UIImage, url:NSURL) {
        self.logoImage = logo
        self.networkName = name
        self.url = url
    }
}