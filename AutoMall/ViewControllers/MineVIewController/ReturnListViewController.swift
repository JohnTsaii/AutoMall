//
//  ReturnListViewController.swift
//  AutoMall
//
//  Created by shenxiaofei on 15/10/8.
//  Copyright © 2015年 ZookParts. All rights reserved.
//

import UIKit

/// 退货申请
class ReturnListViewController: UITableViewController {
    
    var dataSource:[AMOrderLine] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        loadData()
    }
    
    func loadData() {
        AMHTTPRequest.GET("mobile/getCanReturnOrder", parameters: nil, success: { (let operation: AFHTTPRequestOperation!, let response:AnyObject!) -> Void in
            let dict = response as! Dictionary<String,AnyObject>
            if let status = dict["status"]?.integerValue {
                if status == 1 {
                    if let dataDict = dict["data"] as? NSDictionary {
                        //获取到的数据
                        if let orders = dataDict["Orderlist"] as? NSArray {
                            for order in orders {
                                if let orderlines = order["orderlines"] as? NSArray {
                                    for orderline in AMOrderLine.objectArrayWithKeyValuesArray(orderlines) {
                                        self.dataSource.append(orderline as! AMOrderLine)
                                    }
                                }
                            }
                        }
                    }
                } else {
                    //失败
                }
            }
            self.tableView.reloadData()
            }, failure: { (let operation:AFHTTPRequestOperation!,let error:NSError!) -> Void in
            self.tableView.reloadData()
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
        return dataSource.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! ReturnListCell
        let item = dataSource[indexPath.row]
        cell.codeLb.text = item.p_no
        cell.nameLb.text = item.name
        cell.priceLb.text = "\(item.shop_price)"
        cell.numLb.text = "\(item.quantity)"
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
