//
//  ReturnListCell.swift
//  AutoMall
//
//  Created by shenxiaofei on 15/10/8.
//  Copyright © 2015年 ZookParts. All rights reserved.
//

import UIKit

class ReturnListCell: UITableViewCell {
    
    @IBOutlet weak var codeLb: UILabel!  //编码
    @IBOutlet weak var nameLb: UILabel!  //名称
    @IBOutlet weak var priceLb: UILabel! //价格
    @IBOutlet weak var numLb: UILabel!   //数量

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
