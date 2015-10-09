//
//  BaseFilePath.swift
//  AutoMall
//
//  Created by shenxiaofei on 15/9/28.
//  Copyright © 2015年 ZookParts. All rights reserved.
//

import UIKit

class BaseFilePath: NSObject {
    class func documentDirectory() -> String {
        let path: String? = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true).first
        return path!
    }
    
    class func cacheDirectory() -> String {
        let path: String? = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.CachesDirectory, NSSearchPathDomainMask.UserDomainMask, true).first
        return path!
    }
    
    class func tmpDirectory() -> String {
        return NSTemporaryDirectory()
    }
}
