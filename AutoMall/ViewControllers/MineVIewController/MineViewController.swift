//
//  MineViewController.swift
//  AutoMall
//
//  Created by John TSai on 15/9/4.
//  Copyright © 2015年 ZookParts. All rights reserved.
//

import UIKit

enum MineCellType : Int {
    case common,order
}

class MineTableModel: NSObject {
    var identifier: String?
    var title: String?
    var descTitle: String?
    var imageName: String?
    var cellType: MineCellType?
    var badgenumber:Int? //角标数字
}

class MineViewController: UITableViewController {
    var headerView:MineHeaderView?
    private var dataSource:NSArray = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        
        //TODO:登录测试代码，使用测试账号登录
        if !UserBase.user().isLogined {
            UserBase.login("ceshi", pwd: "123123")
        }
        
        configView()
        initTableViewData()
    }
    
    func configView() {
        
        headerView = MineHeaderView()
        tableView.tableHeaderView = headerView
        tableView.registerNib(UINib(nibName: "MineCommonCell", bundle: nil), forCellReuseIdentifier: "MineCommonCell")
        tableView.registerNib(UINib(nibName: "MineOrderCell", bundle: nil), forCellReuseIdentifier: "MineOrderCell")
    }
    
    func initTableViewData() {
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        
    }
    
    //MARK: api
    func loadData(){
        
    }
    
    //MARK: delegate
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell")!
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    override func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
}
