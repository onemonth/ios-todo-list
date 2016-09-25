//
//  KeyedArchiverCache.swift
//  todo-list
//
//  Created by Alfred Hanssen on 8/29/15.
//  Copyright © 2015 One Month. All rights reserved.
//

import Foundation

class KeyedArchiverCache: CacheProtocol {
    
    static let ArchiveExtension = "archive"
    
    func loadObjectForKey(_ key: String) -> AnyObject? {
        
        let path = self.archivePath(key)
        
        return NSKeyedUnarchiver.unarchiveObject(withFile: path) as AnyObject?
    }
    
    func saveObject(_ object: AnyObject, key: String) {

        let path = self.archivePath(key)

        NSKeyedArchiver.archiveRootObject(object, toFile: path)
    }
        
    // MARK: Utilities
    
    func archivePath(_ key: String) -> String {
        
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        
        var URL = Foundation.URL(string: path)!
        
        URL = URL.appendingPathComponent(key)
        URL = URL.appendingPathExtension("archive")
        
        return URL.absoluteString as String
    }
}
