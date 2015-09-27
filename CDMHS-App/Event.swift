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
    
    dynamic var id = 0
    dynamic var title = ""
    dynamic var date = NSDate()
    
    override class func primaryKey() -> String {
        return "id"
    }
    
    
    func deserializeJSON(json:JSON) {
        var formatter = NSDateFormatter()
        formatter.dateFormat = "M/d/y"
        
        self.title = json["title"].stringValue
        self.date = formatter.dateFromString(json["date"].stringValue)!
        
        // for the next object to be cached, increment the realm id 
        if let lastCached = EventService.getLastCachedObject() {
            self.id = lastCached.id + 1
        }
        
    }
    
    
    func stringDate() -> String {
        var formatter = NSDateFormatter()
        formatter.dateFormat = "M/d/y"
       return formatter.stringFromDate(self.date)
    }
}