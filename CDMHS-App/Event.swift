//
//  Event.swift
//  CDMHS-App
//
//  Created by Cole H on 9/6/15.
//  Copyright (c) 2015 Yep Technologies. All rights reserved.
//

import Foundation
import RealmSwift


class Event: Object {

    dynamic var title = ""
    dynamic var date = NSDate()
    dynamic var id = 0

    
    func deserializeJSON(json:JSON) {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "M/d/y"
        self.title = json["title"].stringValue
        self.date = formatter.dateFromString(json["date"].stringValue)!
        self.id = Int(arc4random())
    }
    
    func stringDate() -> String {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "M/d/y"
       return formatter.stringFromDate(self.date)
    }
    
    // set the primary key to the id
    override class func primaryKey() -> String {
        return "id"
    }
}