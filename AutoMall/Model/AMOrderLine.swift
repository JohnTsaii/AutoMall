//
//  AMOrderLine.swift
//  AutoMall
//
//  Created by shenxiaofei on 15/10/8.
//  Copyright © 2015年 ZookParts. All rights reserved.
//

import UIKit

class AMOrderLine: NSObject {
    var prd_id:Int? //详细id
    var pid:Int? //商品id
    var p_no:String? //商品编码
    var img_s:String? //小图
    var type:Int? //商品类型
    var shop_price:CGFloat? //商品价格
    var quantity:Int? //商品数量
    var name:String? //商品名称
    
    override init() {
        super.init()
        prd_id = 0
        pid = nil
        p_no = nil
        img_s = nil
        type = 0
        shop_price = 0
        quantity = 0
        name = nil
    }
}
