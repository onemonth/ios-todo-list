//
//  CacheProtocol.swift
//  todo-list
//
//  Created by Alfred Hanssen on 8/29/15.
//  Copyright © 2015 One Month. All rights reserved.
//

import Foundation

protocol CacheProtocol {
    func loadObjectForKey(key: NSString) -> NSObject?
    func saveObject(object: NSObject, forKey: NSString)
    func removeObjectForKey(key: NSString)
}