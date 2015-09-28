//
//  ServiceProvider.swift
//  Together
//
//  Created by Cole H on 8/5/15.
//  Copyright (c) 2015 AMP Element. All rights reserved.
//

import Foundation

enum ServiceResponseType: Int {
    case STALE = 0
    case FRESH = 1
}

class ServiceResponse<T> {
    let result: T
    let type: ServiceResponseType
    
    init(result:T, type: ServiceResponseType) {
        self.result = result
        self.type = type
    }
    
    static func fresh(result: T) -> ServiceResponse {
        return ServiceResponse(result: result, type: ServiceResponseType.FRESH)
    }
    
    static func stale(result: T) -> ServiceResponse {
        return ServiceResponse(result: result, type: ServiceResponseType.STALE)
    }
    
    func get() -> T {
        return result
    }

}