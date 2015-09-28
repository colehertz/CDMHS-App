//
//  EventService.swift
//  
//
//  Created by Cole H on 9/5/15.
//
//

import Foundation
import Alamofire
import RealmSwift
import RxSwift

class EventService {
    
    static func getEvents() -> Observable<RxCallResult<ServiceResponse<NSArray>>> {
        
        
        return create({ (observer: ObserverOf<RxCallResult<ServiceResponse<NSArray>>>) -> Disposable in
                var cachedEvents = [Event]()
                cachedEvents.removeAll(keepCapacity: false)
                
                do {
                    let realm = try Realm()
                    let realmObjects = realm.objects(Event) // filter so date is greater than or = to current date
                    
                    for obj in realmObjects {
                        cachedEvents.append(obj)
                    }
                    
                    if (cachedEvents.count > 0 ) {
                        sendNext(observer, RxCallResult(value: ServiceResponse.stale(cachedEvents), error:nil))
                    }
                } catch {
                    
                }
                
                
                Alamofire.request(.GET, "\(Api.baseUrl)/events")
                    .response { request, response, data, error in
                        
                        if error == nil {
                            var json = JSON(data:data!)
                            var events = [Event]()
                            
                            if let eventsArray = json["events"].array {
                                do {
                                    let realm = try Realm()
                                    
                                    for e in eventsArray {
                                        print(e)
                                        let event = Event()
                                        event.deserializeJSON(e)
                                        events.append(event)
                                        realm.write {
                                            realm.add(event, update: true)
                                        }
                                        
                                    }
                                    //successFunc(events: events)
                                    sendNext(observer, RxCallResult(value: ServiceResponse.fresh(events), error:nil))
                                } catch {
                                
                                }
                            }
                        } else {
                            sendNext(observer, RxCallResult(value: nil, error: error))
                            //errorFunc(error, response)
                        }
                }
        
            return AnonymousDisposable{}
        })

    }
    
    static func getLastObjectId() -> Int {
        do {
            let realm = try Realm()
            if let lastObj = realm.objects(Event).last {
                return lastObj.id
            }
        } catch {
            
        }
        return 0
    }

}