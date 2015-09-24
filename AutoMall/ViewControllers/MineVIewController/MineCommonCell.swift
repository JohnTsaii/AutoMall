//
//  MineCommonCell.swift
//  AutoMall
//
//  Created by shenxiaofei on 15/9/24.
//  Copyright © 2015年 ZookParts. All rights reserved.
//

import UIKit

class MineCommonCell: UITableViewCell {
    
    @IBOutlet weak var ImageV: UIView!
    @IBOutlet weak var leftLb: UILabel!
    @IBOutlet weak var rightLb: UILabel!
    @IBOutlet weak var badgeImageBg: UIImageView!
    @IBOutlet weak var badgeLb: UILabel!
    
    var badge:Int? {
        willSet {
            if let value = newValue {
                badgeLb.text = String.init(format: "%d", value)
            }
        }
    }
    
    var mineCellModel:MineTableModel? {
        didSet {
            if let value = mineCellModel {
                if let imageName = value.imageName {
                    imageView?.image = UIImage(named: imageName)
                }
                if let title = value.title {
                    leftLb.text = title
                }
                if let descTitle = value.descTitle {
                    rightLb.text = descTitle
                }
                badge = value.badgenumber
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
