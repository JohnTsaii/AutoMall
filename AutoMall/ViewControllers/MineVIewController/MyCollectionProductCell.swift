//
//  MyCollectionProductCell.swift
//  AutoMall
//
//  Created by shenxiaofei on 15/10/8.
//  Copyright © 2015年 ZookParts. All rights reserved.
//

import UIKit

class MyCollectionProductCell: UITableViewCell {
    
    @IBOutlet var codeLb:UILabel! //正配码
    @IBOutlet var nameLb:UILabel! //商品名称
    @IBOutlet var imgV:UIImageView! //商品图片
    @IBOutlet var dateLb:UILabel! //收藏日期

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
