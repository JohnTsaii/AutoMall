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
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
