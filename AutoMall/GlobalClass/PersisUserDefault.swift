//
//  PersistanceUserDefault.swift
//  AutoMall
//
//  Created by shenxiaofei on 15/9/28.
//  Copyright © 2015年 ZookParts. All rights reserved.
//

import UIKit

class PersisUserDefault: NSObject {
    private static let  userDefault: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    static func setObj(obj:AnyObject?,forKey key:String) {
        PersisUserDefault.userDefault.setObject(obj, forKey: key)
    }
    static func objForKey(key:String) -> AnyObject? {
        return PersisUserDefault.userDefault.objectForKey(key)
    }
}
