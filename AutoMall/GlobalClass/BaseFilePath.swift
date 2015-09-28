//
//  BaseFilePath.swift
//  AutoMall
//
//  Created by shenxiaofei on 15/9/28.
//  Copyright © 2015年 ZookParts. All rights reserved.
//

import UIKit

class BaseFilePath: NSObject {
    static func documentDirectory() -> String {
        let path: String? = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true).first
        if let value = path {
            return value
        } else {
            return ""
        }
    }
    
    static func cacheDirectory() -> String {
        let path: String? = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.CachesDirectory, NSSearchPathDomainMask.UserDomainMask, true).first
        if let value = path {
            return value
        } else {
            return ""
        }
    }
    
    static func tmpDirectory() -> String {
        return NSTemporaryDirectory()
    }
}
