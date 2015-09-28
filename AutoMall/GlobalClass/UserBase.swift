//
//  UserBase.swift
//  AutoMall
//
//  Created by shenxiaofei on 15/9/28.
//  Copyright © 2015年 ZookParts. All rights reserved.
//

import UIKit

public let LoginSuccessNotification:String = "LoginSuccessNotification"
public let loginFailedNotification:String = "loginFailedNotification"

enum UserKey:String {
    case token = "UserKeyToken"
}

class UserBase: NSObject {
    static let instance:UserBase = UserBase()
    
    var token:String? {
        get {
            return PersisUserDefault.objForKey(UserKey.token.rawValue) as? String
        }
        set {
            PersisUserDefault.setObj(newValue, forKey: UserKey.token.rawValue)
        }
    }
    
    func login(userName:String, pwd:String){
//        let params = ["user":userName,"pwd":pwd]
    }
    
}
