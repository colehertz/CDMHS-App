//
//  Event.swift
//  CDMHS-App
//
//  Created by Cole H on 9/6/15.
//  Copyright (c) 2015 Yep Technologies. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift

class Event: Object {

    var title = ""
    var date = NSDate()
    
    
    
    required init() {
       super.init()

    }
    
    func deserializeJSON(json:JSON) {
        var formatter = NSDateFormatter()
        formatter.dateFormat = "M/d/y"
        self.title = json["title"].stringValue
        self.date = formatter.dateFromString(json["date"].stringValue)!
    }
    
    func stringDate() -> String {
        var formatter = NSDateFormatter()
        formatter.dateFormat = "M/d/y"
       return formatter.stringFromDate(self.date)
    }
}