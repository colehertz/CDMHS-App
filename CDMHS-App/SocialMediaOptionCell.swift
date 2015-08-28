//
//  SocialMediaOptionView.swift
//  CDMHS-App
//
//  Created by Cole H on 8/27/15.
//  Copyright (c) 2015 Yep Technologies. All rights reserved.
//

import Foundation
import UIKit

class SocialMediaOptionCell: UITableViewCell {
    @IBOutlet var logoImageview: UIImageView!
    @IBOutlet var networkLabel: UILabel!
    
    func setObject(obj:SocialMediaOption) {
        logoImageview.image = obj.logoImage
        networkLabel.text = obj.networkName
    }
}
    
