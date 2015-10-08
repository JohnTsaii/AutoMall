//
//  MyCollectionViewController.swift
//  AutoMall
//
//  Created by shenxiaofei on 15/10/8.
//  Copyright © 2015年 ZookParts. All rights reserved.
//

import UIKit

class MyCollectionViewController: UIViewController {
    
    @IBOutlet var contentView:UIView!
    
    lazy var shopVC:MyCollectionShopViewController =  MyStoryboard.sb().instantiateViewControllerWithIdentifier("MyCollectionShopViewController") as! MyCollectionShopViewController
    
    lazy var productVC:MyCollectionProductViewController = MyStoryboard.sb().instantiateViewControllerWithIdentifier("MyCollectionProductViewController") as! MyCollectionProductViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addChildViewController(shopVC)
        self.addChildViewController(productVC)
        
        contentView.addSubview(productVC.view)
        productVC.view.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(UIEdgeInsetsMake(0, 0, 0, 0))
        }
    }
    
    //MAKR: action
    @IBAction func productClick() {
        switchToShop(false)
    }
    
    @IBAction func shopClick() {
        switchToShop(true)
    }
    
    func switchToShop(switchToShop:Bool) {
        if switchToShop {
            productVC.view.removeFromSuperview()
            shopVC.view.frame = contentView.bounds
            contentView.addSubview(shopVC.view)
        } else {
            shopVC.view.removeFromSuperview()
            productVC.view.frame = contentView.bounds
            contentView.addSubview(productVC.view)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
