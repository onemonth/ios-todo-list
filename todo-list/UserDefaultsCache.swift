//
//  UserDefaultsCache.swift
//  todo-list
//
//  Created by Alfred Hanssen on 8/29/15.
//  Copyright © 2015 One Month. All rights reserved.
//

import Foundation

class UserDefaultsCache: CacheProtocol {
    
    func loadObjectForKey(key: String) -> AnyObject? {
        return NSUserDefaults.standardUserDefaults().objectForKey(key)
    }
    
    func saveObject(object: AnyObject, key: String) {
        NSUserDefaults.standardUserDefaults().setObject(object, forKey: key)
    }
    
    func removeObjectForKey(key: String) {
        NSUserDefaults.standardUserDefaults().removeObjectForKey(key)
    }
}