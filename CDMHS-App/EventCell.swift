//
//  EventCell.swift
//  CDMHS-App
//
//  Created by Cole H on 9/6/15.
//  Copyright (c) 2015 Yep Technologies. All rights reserved.
//

import Foundation
import UIKit

class EventCell: UITableViewCell {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    func setupCell(event:Event) {
        
        titleLabel.text = event.title
        dateLabel.text = event.stringDate()
    }
}