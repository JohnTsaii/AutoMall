
//
//  AMShop.swift
//  AutoMall
//
//  Created by shenxiaofei on 15/10/8.
//  Copyright © 2015年 ZookParts. All rights reserved.
//

import UIKit

class AMShop: NSObject {
    var fid:Int? //明细id
    var sp_title:String? //店铺名称
    var sp_description_x: String? //店铺介绍
    var sp_recommend_img: String? //图片
    var sp_address: String?       //地址
    var sp_description_m: String? //正配自营：正品
    var post_date: String?        //收藏日期
    
    override init() {
        super.init()
        fid = 0
        sp_title = nil
        sp_description_x = nil
        sp_recommend_img = nil
        sp_address = nil
        sp_description_m = nil
        post_date = nil
    }
}
