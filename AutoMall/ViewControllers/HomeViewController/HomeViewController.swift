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
    var imagePageView: JTImagePageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.createPageImageView()
        self.setNavBarLayout()
        self.createCollectionView()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func didReceiveMemoryWarning() {
        
    }
    
    private func createPageImageView() {
        self.imagePageView? = JTImagePageView(frame: CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 200))
    }
    
    private func createCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        self.collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        self.collectionView?.dataSource = self
        self.collectionView?.delegate = self
        self.view.addSubview(self.collectionView!)
        
        self.collectionView?.registerClass(AMProductCollectionCell.self, forCellWithReuseIdentifier: productCellIdentifier)
        self.collectionView?.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: commonCell)
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
//                cell.contentView.addSubview(self.imagePageView!)
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
        
        cell.configCell()
        
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    // MARK: UICollectionViewDelegateFlowLayout
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: 80, height: 80)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 1
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
