//
//  HomeViewController.swift
//  AutoMall
//
//  Created by John TSai on 15/9/4.
//  Copyright © 2015年 ZookParts. All rights reserved.
//

import UIKit


class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    let productCellIdentifier = "AMProductCollectionCell"
    let commonCell = "UICollectionViewCell"
    
    var collectionView: UICollectionView?
    var imagePageView: JTImagePageView?
    
    var data: AMHomeModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // TODO:测试push
        createPageImageView()
        setNavBarLayout()
        createCollectionView()
        getData()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        
    }
    
    private func createPageImageView() {
        self.imagePageView = JTImagePageView(frame: CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 200))
        
        self.imagePageView?.images = [
            UIImage(named: "home_direct")!,
            UIImage(named: "home_group")!,
            UIImage(named: "home_item_selected")!,
            UIImage(named: "home_item_unselected")!
        ]
    }
    
    private func createCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        self.collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        self.collectionView?.dataSource = self
        self.collectionView?.delegate = self
        self.collectionView?.backgroundColor = UIColor.whiteColor()
        self.collectionView?.showsHorizontalScrollIndicator = false
        self.view.addSubview(self.collectionView!)
        
        self.collectionView?.registerClass(AMProductCollectionCell.self, forCellWithReuseIdentifier: productCellIdentifier)
        self.collectionView?.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: commonCell)
    }
    
    func getData() {
        
        AMHTTPRequest.sharedManager.GET("mobile/index", parameters: nil,
            success: { (let operation: AFHTTPRequestOperation!, let responseObject: AnyObject!) -> Void in
//                self.data = AMHomeModel(keyValues: responseObject)
//                print(self.data?.status)
            }) { (let operation: AFHTTPRequestOperation!, let error: NSError!) -> Void in
                
        }
    }
    
    private func setNavBarLayout() {
        let storeLabel: UILabel! = UILabel()
        storeLabel.text = "正配商城"
        storeLabel.textColor = UIColor.whiteColor()
        storeLabel.sizeToFit()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: storeLabel)
        
        self.navigationItem.titleView = UISearchBar()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "home_message"),
            style: UIBarButtonItemStyle.Bordered,
            target: self,
            action: Selector("messageItemClicked:"))
        
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.whiteColor()
    }
    
    func messageItemClicked(button: UIButton) {
        print("button clicked")
    }
    
    
    // MARK: UICollectionViewDataSource
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {return 8}
        if section == 1 {return 4}
        return 10
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell: UICollectionViewCell = collectionView .dequeueReusableCellWithReuseIdentifier(commonCell, forIndexPath: indexPath)
            
            if indexPath.row == 0 {
                cell.contentView.addSubview(self.imagePageView!)
                self.imagePageView?.backgroundColor = UIColor.whiteColor()
                return cell
            }
            
            if indexPath.row >= 1 && indexPath.row <= 4{
                let imageViewWidth = CGRectGetWidth(cell.contentView.frame)
                let imageView: UIImageView = UIImageView(frame: CGRectMake(0, 0, imageViewWidth, imageViewWidth))
                cell.contentView.addSubview(imageView)
                
                let title: UILabel = UILabel(frame: CGRectMake(0, imageViewWidth, imageViewWidth, 15))
                title.textColor = UIColor.grayColor()
                cell.contentView.addSubview(title)
                
                switch indexPath.row {
                    case 1:
                        title.text = "正配自营"
                    case 2:
                        title.text = "厂家直营"
                    case 3:
                        title.text = "秒杀"
                    default:
                        title.text = "团购"
                }
            }
            
            let imageView: UIImageView = UIImageView(frame: cell.contentView.frame)
            imageView.backgroundColor = UIColor.redColor()
            cell.contentView.addSubview(imageView)
        }
        
        let cell: AMProductCollectionCell! = collectionView.dequeueReusableCellWithReuseIdentifier(productCellIdentifier, forIndexPath: indexPath) as? AMProductCollectionCell
        cell.backgroundColor = UIColor.redColor()
        cell.configCell()
        
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    // MARK: UICollectionViewDelegateFlowLayout
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        if indexPath.section == 0 {
            if indexPath.row == 0 { return CGSizeMake(CGRectGetWidth(self.view.frame) - 1, 200) }
            if indexPath.row >= 1 && indexPath.row <= 4 { return CGSizeMake(CGRectGetWidth(self.view.frame) / 4 - 1, 80) }
        
            return CGSizeMake(CGRectGetWidth(self.view.frame) / 3 - 1, 80)
        }
        
        return CGSizeMake(CGRectGetWidth(self.view.frame) / 3 - 1, 80)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 320, height: 40)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: 320, height: 40)
    }
}
