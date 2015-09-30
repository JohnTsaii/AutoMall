//
//  ShopCarViewController.swift
//  AutoMall
//
//  Created by John TSai on 15/9/4.
//  Copyright © 2015年 ZookParts. All rights reserved.
//

import UIKit

class ShopCarViewController: UITableViewController {
    
    @IBOutlet weak var totalLb:UILabel! //合计
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        
        if UserBase.user().isLogined {
            //已登录
            loadData()
        } else {
            
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        
    }
    
    //MARK: api
    func loadData(){
        AMProgressHUD.showWaiting(view)
        AMHTTPRequest.GET("mobile/cart", parameters: nil, success: { (operation:AFHTTPRequestOperation!, response:AnyObject!) -> Void in
            AMProgressHUD.dismiss(self.view)
        }, failure:{ (operation:AFHTTPRequestOperation!, error:NSError!) -> Void in
            AMProgressHUD.dismiss(self.view)
        })
    }
    
    //MARK: table delegate
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    //MARK: Action
    @IBAction func toPay() {
        
    }
    
    @IBAction func selectAll() {
        
    }
}
