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
        
        var path = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as NSString
        
        path = path.stringByAppendingPathComponent(key)
        path = path.stringByAppendingPathExtension(KeyedArchiverCache.ArchiveExtension)!

        return path as String
    }
}