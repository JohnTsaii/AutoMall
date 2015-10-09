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
    var Pid: Int64?
    var Mid:Int?
    var p_no: String?  //商品编码
    var alive: Int16?
    var type: Int16?
    var limit_count: String?
    var limit_price: String?
    var shop_name: String?  //商城名称
    var img_s: String?
    var price: Int32?
    var Name: String?
    var datetime: String?
    var post_date: String? //收藏日期
    
    override init() {
        super.init()
        
        self.sort = 0
        self.location = 0
        self.current_price = 0
        self.Pid = 0
        self.p_no = nil
        self.alive = 0
        self.Mid = 0
        self.type = 0
        self.limit_count = nil
        self.limit_price = nil
        self.shop_name = nil
        self.img_s = nil
        self.price = 0
        self.Name = nil
        self.datetime = nil
        self.post_date = nil
    }
}
