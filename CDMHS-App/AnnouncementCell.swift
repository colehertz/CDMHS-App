//
//  AnnouncementCell.swift
//  CDMHS-App
//
//  Created by Cole H on 8/27/15.
//  Copyright (c) 2015 Yep Technologies. All rights reserved.
//

import Foundation
import UIKit

class AnnouncementCell: UITableViewCell {
    var titleLabel: UILabel!
    var bodyLabel: UILabel!
    var dateLabel: UILabel!
    
    var dateFormatter = NSDateFormatter()
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
    }
    
    func setObject(obj: Announcement) {
        self.titleLabel.text = obj.title
        self.bodyLabel.text = obj.body
        self.dateLabel.text = dateFormatter.stringFromDate(obj.creationDate)
    }
}