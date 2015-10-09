//
//  UIScreenExtension.swift
//  AutoMall
//
//  Created by xiaofeishen on 15/10/9.
//  Copyright © 2015年 ZookParts. All rights reserved.
//

import Foundation

extension UIScreen {
    class func width() -> CGFloat {
        return UIScreen.mainScreen().bounds.size.width
    }
    
    class func height() -> CGFloat {
        return UIScreen.mainScreen().bounds.size.height
    }
}