//
//  OrderDoneCell.swift
//  AutoMall
//
//  Created by shenxiaofei on 15/9/24.
//  Copyright © 2015年 ZookParts. All rights reserved.
//

import UIKit

class OrderDoneCell: UITableViewCell {
    
    @IBOutlet weak var orderNoLb:UILabel!
    @IBOutlet weak var orderDateLb:UILabel!
    @IBOutlet weak var orderReceiverLb:UILabel!
    @IBOutlet weak var orderPriceLb:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
