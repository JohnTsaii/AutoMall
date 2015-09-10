//
//  AMProductCollectionCell.swift
//  AutoMall
//
//  Created by John TSai on 15/9/10.
//  Copyright © 2015年 ZookParts. All rights reserved.
//

import UIKit

class AMProductCollectionCell: UICollectionViewCell {
    var productImage: UIImageView?
    var name: UILabel?
    var price: UILabel?
    
    convenience init() {
        self.init()
        setUp()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.productImage = nil
        self.name = nil
        self.price = nil
        
        setUp()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.productImage = nil
        self.name = nil
        self.price = nil
        
        setUp()
    }
    
    private func setUp() {
        let productImageWidth: CGFloat = CGRectGetWidth(self.contentView.frame)
        
        self.productImage = UIImageView(frame: CGRectMake(0, 0, productImageWidth, productImageWidth))
        
        self.name = UILabel(frame: CGRectMake(0, productImageWidth, productImageWidth, 15))
        self.name?.textColor = UIColor.grayColor()
        
        self.price = UILabel(frame: CGRectMake(0, productImageWidth + 15, productImageWidth, 15))
        self.price?.textColor = UIColor(red:0.98, green:0.16, blue:0.16, alpha:1)
        
        
        self.contentView.addSubview(self.productImage!)
        self.contentView.addSubview(self.name!)
        self.contentView.addSubview(self.price!)
    }
    
    func configCell() {
    }

}
