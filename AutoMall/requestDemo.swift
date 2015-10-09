//
//  requestDemo.swift
//  AutoMall
//
//  Created by shenxiaofei on 15/10/8.
//  Copyright © 2015年 ZookParts. All rights reserved.
//

import UIKit

class requestDemo: NSObject {
    func demo() {
        AMHTTPRequest.GET("mobile/login", parameters: nil, success: { (let operation: AFHTTPRequestOperation!, let response:AnyObject!) -> Void in
            
            }, failure: { (let operation:AFHTTPRequestOperation!,let error:NSError!) -> Void in
                
        })
    }
}
