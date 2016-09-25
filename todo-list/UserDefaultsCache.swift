//
//  UserDefaultsCache.swift
//  todo-list
//
//  Created by Alfred Hanssen on 8/29/15.
//  Copyright © 2015 One Month. All rights reserved.
//

import Foundation

class UserDefaultsCache: CacheProtocol {
    
    func loadObjectForKey(_ key: String) -> AnyObject? {
        return UserDefaults.standard.object(forKey: key) as AnyObject?
    }
    
    func saveObject(_ object: AnyObject, key: String) {
        UserDefaults.standard.set(object, forKey: key)
    }
    
}
