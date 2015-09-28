//
//  RxResult.swift
//  Together
//
//  Created by Cole H on 7/16/15.
//  Copyright (c) 2015 AMP Element. All rights reserved.
//

import Foundation

class RxCallResult<T> {
    /// The value of interest in this RxResult
    let value: T?
    /// Any error that ocurred in the Rx generation observable
    let error: NSError?
    
    /// Create an RxCallResult with a Value and an Error
    init(value: T?, error: NSError?) {
        self.value = value
        self.error = error
    }
    
    /// Create an RxCallResult with a Value
    convenience init(value: T) {
        self.init(value: value, error: nil)
    }
    
    /// Create an empty RxCallResult (for use with BehaviorSubject)
    convenience init() {
        self.init(value: nil, error: nil)
    }
    
    /// Get the value of interest from the RxCallResult
    func get() -> T? {
        return value
    }
    
    /// Does this RxCallResult represent an error
    func hasError() -> Bool {
        return self.error != nil
    }
    
    /**
    Does this RxCallResult have anything of interest, or is it just an empty placeholder
    (probably for BehaviorSubject)
    */
    func isEmpty() -> Bool {
        if (hasError() || value != nil) {
            return false
        }
        return true
    }
    
    /// Generate a debug friendly description of the RxCallResult
    func description() -> String {
        
        if let val = value as? NSObject {
            return val.description
        }
        
        return ""
    }
}