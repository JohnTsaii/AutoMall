//
//  AMAdvertising.swift
//  AutoMall
//
//  Created by John TSai on 15/9/22.
//  Copyright © 2015年 ZookParts. All rights reserved.
//

import Foundation

class AMAdvertising: NSObject {
    var abstract: String?
    var title: String?
    var sort: Int16?
    var height: Int16?
    var width: Int16?
    var link: String?
    var path: String?
    var used: Bool?
    var type: Int16?
    var advid: Int32?
    
    override init() {
        super.init()
        abstract = nil
        title = nil
        sort = nil
        height = nil
        width = nil
        link = nil
        path = nil
        used = nil
        type = nil
        advid = nil
    }
}
