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
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    //去结算
    @IBAction func toPay() {
        
    }
    
    @IBAction func selectAll() {
        
    }
}
