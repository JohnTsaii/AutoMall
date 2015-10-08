//
//  MyCollectionCell.swift
//  AutoMall
//
//  Created by shenxiaofei on 15/10/8.
//  Copyright © 2015年 ZookParts. All rights reserved.
//

import UIKit

class MyCollectionShopCell: UITableViewCell {
    /// 店铺名称
    @IBOutlet var nameLb:UILabel!
    /// 简介
    @IBOutlet var detailLb:UILabel!
    /// 收藏日期
    @IBOutlet var dateLb:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
