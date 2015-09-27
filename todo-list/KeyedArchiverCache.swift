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
    
    func loadObjectForKey(key: String) -> AnyObject? {
        
        let path = self.archivePath(key)
        
        return NSKeyedUnarchiver.unarchiveObjectWithFile(path)
    }
    
    func saveObject(object: AnyObject, key: String) {

        let path = self.archivePath(key)

        NSKeyedArchiver.archiveRootObject(object, toFile: path)
    }
        
    // MARK: Utilities
    
    func archivePath(key: String) -> String {
        
        let path = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0]
        
        var URL = NSURL(string: path)!
        
        URL = URL.URLByAppendingPathComponent(key)
        URL = URL.URLByAppendingPathExtension("archive")
        
        return URL.absoluteString as String
    }
}