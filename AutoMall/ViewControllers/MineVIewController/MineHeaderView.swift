//
//  MineHeaderView.swift
//  AutoMall
//
//  Created by shenxiaofei on 15/9/24.
//  Copyright © 2015年 ZookParts. All rights reserved.
//

import UIKit

class MineHeaderView: UIView {
    
    @IBOutlet var userNameLb:UILabel!
    @IBOutlet var loginBtn:UIButton!
    @IBOutlet var registBtn:UIButton!
    
    override func awakeFromNib() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "logedSuccess:", name: AMLoginSuccessNotification, object: nil)
        
    }
    
    //MAKR: notification
    func logedSuccess() {
        layoutIfNeeded()
        userNameLb.text = UserBase.user().userName
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if UserBase.user().isLogined {
            loginBtn.hidden = true
            registBtn.hidden = true
            userNameLb.hidden = false
        } else {
            loginBtn.hidden = false
            registBtn.hidden = false
            userNameLb.hidden = true
        }
    }
}
