//
//  AMProduct.swift
//  AutoMall
//
//  Created by John TSai on 15/9/13.
//  Copyright © 2015年 ZookParts. All rights reserved.
//

import Foundation

class AMProduct: NSObject {
    var sort: Int16?
    var location: Int16?
    var current_price: Int32?
    var pid: Int64?
    var p_no: String?
    var alive: Int16?
    var type: Int16?
    var limit_count: String?
    var limit_price: String?
    var shop_name: String?
    var img_s: String?
    var price: Int32?
    var name: String?
    var datetime: String?
    
    override init() {
        super.init()
        
        self.sort = 0
        self.location = 0
        self.current_price = 0
        self.pid = 0
        self.p_no = nil
        self.alive = 0
        self.type = 0
        self.limit_count = nil
        self.limit_price = nil
        self.shop_name = nil
        self.img_s = nil
        self.price = 0
        self.name = nil
        self.datetime = nil
        
    }
}
