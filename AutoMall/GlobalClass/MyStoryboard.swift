//
//  MyStoryboard.swift
//  AutoMall
//
//  Created by shenxiaofei on 15/10/8.
//  Copyright © 2015年 ZookParts. All rights reserved.
//

import UIKit

class MyStoryboard: NSObject {
    private static let instance = UIStoryboard(name: "Main", bundle: nil)
    class func sb() -> UIStoryboard {
        return instance
    }
}
