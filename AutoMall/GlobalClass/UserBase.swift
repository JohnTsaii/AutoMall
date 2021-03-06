//
//  UserBase.swift
//  AutoMall
//
//  Created by shenxiaofei on 15/9/28.
//  Copyright © 2015年 ZookParts. All rights reserved.
//

import UIKit

public let AMLoginSuccessNotification:String = "LoginSuccessNotification"
public let AMLoginFailedNotification:String = "loginFailedNotification"
public let AMLogoutSuccessNotification:String = "AMLogoutSuccessNotification"

enum UserKey:String {
    case token = "UserKeyToken"
    case userName = "UserKeyUserName"
}

class UserBase: NSObject {
    /**
    单例变量
    */
    private static let instance:UserBase = UserBase()
    
    /**
    用户信息单例
    */
    class func user() ->UserBase {
        NSUserDefaults.standardUserDefaults()
        return instance
    }
    
    /// 是否是登录状态
    var isLogined:Bool {
        get {
            if let temp = token {
                return !temp.isEmpty
            } else {
                return false
            }
        }
    }
    
    /// token
    var token:String? {
        get {
            return PersisUserDefault.objForKey(UserKey.token.rawValue) as? String
        }
        set {
            PersisUserDefault.setObj(newValue, forKey:UserKey.token.rawValue)
        }
    }
    
    /// 用户名
    var userName:String? {
        get {
            return PersisUserDefault.objForKey(UserKey.userName.rawValue) as? String
        }
        set {
            PersisUserDefault.setObj(newValue, forKey:UserKey.userName.rawValue)
        }
    }
    
    //MARK:api服务
    /**
    登录api
    */
    class func login(userName:String, pwd:String) {
        let params = ["user":userName,"pwd":pwd]
        
        //登录请求
        AMHTTPRequest.sharedManager.GET("mobile/login", parameters: params, success: { (let operation: AFHTTPRequestOperation!, let response:AnyObject!) -> Void in
            let dict:Dictionary<String,AnyObject> = response as! Dictionary<String,AnyObject>
            var msg:String?,success:Bool = false
            if let status = dict["status"]?.integerValue {
                if status == 1 {
                    success = true
                    if let dataDict = dict["data"] as? NSDictionary {
                        UserBase.user().token = dataDict["token"] as? String
                        UserBase.user().userName = userName
                    }
                } else {
                    //失败
                    if let dataDict = dict["data"] as? NSDictionary {
                        msg = dataDict["msg"] as? String
                    }
                }
            }
            if success {
                NSNotificationCenter.defaultCenter().postNotificationName(AMLoginSuccessNotification, object:nil)
            } else {
                NSNotificationCenter.defaultCenter().postNotificationName(AMLoginFailedNotification, object:nil)
                if let _ = msg {
                    //失败有提示
                    AMProgressHUD.showFailed(msg!)
                }
            }
        }, failure: { (let operation:AFHTTPRequestOperation!,let error:NSError!) -> Void in
                
        })
    }
    
    /**
    注册api
    */
    class func regist(userName:String,pwd:String) {
        
    }
    
}
