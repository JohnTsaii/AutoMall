//
//  AMHTTPRequest.swift
//  AutoMall
//
//  Created by John TSai on 15/9/9.
//  Copyright © 2015年 ZookParts. All rights reserved.
//

import Foundation

let BaseURL: String! = "http://andmobi.f3322.net:8090/rest"
let BaseImageURL: String! = "http://andmobi.f3322.net:8090/upl_imags"

class AMHTTPRequest: AFHTTPRequestOperationManager {
    
    static let sharedManager: AMHTTPRequest! = AMHTTPRequest(isCommonRequest: true)
    static let sharedImageManager: AMHTTPRequest! = AMHTTPRequest(isCommonRequest: false)
   
    init(let isCommonRequest: Bool) {
        if isCommonRequest {
            super.init(baseURL: NSURL(string: BaseURL))
        } else {
            super.init(baseURL: NSURL(string: BaseImageURL))
        }
//        self.requestSerializer = AFHTTPRequestSerializer()
//        self.responseSerializer = AFHTTPResponseSerializer()
    }
    
    /**
    get 请求
    */
    class func GET(url:String, parameters: Dictionary<String, AnyObject>?,success:((AFHTTPRequestOperation!, AnyObject!) -> Void)?,failure:((AFHTTPRequestOperation!,NSError!) -> Void)?) {
        AMHTTPRequest.sharedManager.GET(url, parameters:auth(parameters), success:success, failure: failure)
    }
    
    /**
    post 请求
    */
    class func POST(url:String, parameters: Dictionary<String, AnyObject>?,success:((AFHTTPRequestOperation!, AnyObject!) -> Void)?,failure:((AFHTTPRequestOperation!,NSError!) -> Void)?) {
        
        AMHTTPRequest.sharedManager.POST(url, parameters:auth(parameters), success:success, failure: failure)
    }
    
    /**
    添加auth 验证
    */
    class func auth(var para:Dictionary<String, AnyObject>?) -> Dictionary<String, AnyObject>! {
        if let _ = para {
            
        } else {
            para = Dictionary()
        }
        if UserBase.user().isLogined {
            para?["auth"] = UserBase.user().token
        }
        return para
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
