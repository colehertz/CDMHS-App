//
//  EventService.swift
//  
//
//  Created by Cole H on 9/5/15.
//
//

import Foundation
import Alamofire


class EventService {
    
    static func getEvents(successFunc:(events:[Event])-> Void, errorFunc:(NSError!, NSHTTPURLResponse?) -> Void) {
        
        Alamofire.request(.GET, "\(Api.baseUrl)/events")
            .response { request, response, data, error in
                
                if error == nil {
                    var json = JSON(data:data!)
                    var events = [Event]()
                    
                    if let eventsArray = json["events"].array {
                        for e in eventsArray {
                            print(e)
                            var event = Event()
                            event.deserializeJSON(e)
                            events.append(event)
                        }
                        successFunc(events: events)
                    }
                } else {
                    errorFunc(error, response)
                }
        }
    }

}