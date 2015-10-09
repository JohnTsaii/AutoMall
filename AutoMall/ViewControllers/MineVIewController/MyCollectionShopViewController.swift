//
//  MyCollectionShopViewController.swift
//  AutoMall
//
//  Created by shenxiaofei on 15/10/8.
//  Copyright © 2015年 ZookParts. All rights reserved.
//

import UIKit

class MyCollectionShopViewController: UITableViewController {
    var pageNo:Int = 1
    var pageCount:Int = 0
    var dataSource:[AMShop] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.footer = MJRefreshBackFooter.init(refreshingBlock: { () -> Void in
            //上拉加载
            self.pageNo++;
            self.loadData()
        })
        loadData()
    }
    
    /**
    api
    */
    func loadData(){
        AMHTTPRequest.GET("mobile/myStoreFavory", parameters: nil, success: { (let operation: AFHTTPRequestOperation!, let response:AnyObject!) -> Void in
            let dict:Dictionary<String,AnyObject> = response as! Dictionary<String,AnyObject>
            if let status = dict["status"]?.integerValue {
                if status == 1 {
                    if let dataDict = dict["data"] as? NSDictionary {
                        //分页数据
                        if let pc = dataDict["pc"] as? NSDictionary {
                            if let pageNo = pc["pageNo"] as? Int {
                                self.pageNo = pageNo
                            }
                            if let pageCount = dataDict["pageCount"] as? Int {
                                self.pageCount = pageCount
                            }
                            if self.pageNo == self.pageCount {
                                self.tableView.footer.state = MJRefreshStateNoMoreData
                            }
                        }
                        //获取到的数据
                        if let shops = dataDict["favorys"] as? NSArray {
                            for item in AMShop.objectArrayWithKeyValuesArray(shops) {
                                self.dataSource.append(item as! AMShop)
                            }
                        }
                    }
                } else {
                    //失败
                }
            }
            self.tableView.footer.endRefreshing()
            }, failure: { (let operation:AFHTTPRequestOperation!,let error:NSError!) -> Void in
            self.tableView.footer.endRefreshing()
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! MyCollectionShopCell
        let item  = dataSource[indexPath.row]
        cell.nameLb.text = item.sp_title
        cell.detailLb.text = item.sp_description_m
        cell.dateLb.text = item.post_date
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
