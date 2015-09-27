//
//  EventService.swift
//  
//
//  Created by Cole H on 9/5/15.
//
//

import Foundation
import Alamofire
import SwiftyJSON
import RealmSwift

class EventService {
    
    static func getEvents(successFunc:(events:[Event])-> Void, errorFunc:(NSError!, NSHTTPURLResponse?) -> Void) {
        
        Alamofire.request(.GET, "\(Api.baseUrl)/events")
            .response { request, response, data, error in
                
                if error == nil {
                    var json = JSON(data:data!)
                    var events = [Event]()
                    let realm = Realm()
                    
                    if let eventsArray = json["events"].array {
                        for e in eventsArray {
                            println(e)
                            var event = Event()
                            event.deserializeJSON(e)
                            events.append(event)
                            
                            realm.write {
                                realm.add(event, update: true)
                            }
                        }
                        
                        successFunc(events: events)
                    }
                } else {
                    errorFunc(error, response)
                }
        }
    }
    
    static func getLastCachedObject() -> Event? {
        let realm = Realm()
        let sortedEvents = realm.objects(Event).sorted("id", ascending: false)
        
        if (sortedEvents.count > 0 ) {
            return sortedEvents[0]
        }
        
        return nil
    }

}