//
//  Persistance.swift
//  AutoMall
//
//  Created by shenxiaofei on 15/9/28.
//  Copyright © 2015年 ZookParts. All rights reserved.
//

import UIKit

class PersisFileHelper: NSObject {
    static func persitance(filePath :String, object:AnyObject) {
       let data = NSKeyedArchiver.archivedDataWithRootObject(object)
        data.writeToFile(filePath, atomically: true)
    }
    
    static func getPersistanceObj(filePath :String) -> AnyObject? {
        let obj = NSKeyedUnarchiver.unarchiveObjectWithFile(filePath);
        return obj
    }
}
