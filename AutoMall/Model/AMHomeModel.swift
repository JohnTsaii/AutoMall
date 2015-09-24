//
//  AMHomeModel.swift
//  AutoMall
//
//  Created by John TSai on 15/9/13.
//  Copyright © 2015年 ZookParts. All rights reserved.
//

import Foundation

class AMHomeModel: NSObject {
    var status: Int16?
    var data: Array<AnyObject>?
    var advs: Array<AMProduct>?
    
   
    override init() {
        super.init()
        self.status = 0
        self.data = nil
        self.advs = nil
    }
   
    
}
