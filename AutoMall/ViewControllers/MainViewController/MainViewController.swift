//
//  MainViewController.swift
//  AutoMall
//
//  Created by John TSai on 15/8/31.
//  Copyright © 2015年 ZookParts. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    lazy var homeVC: HomeViewController = {
        return HomeViewController()
    }()
    
    lazy var sortVC: SortViewController = {
        return SortViewController()
    }()
    
    lazy var searchVC: SearchViewController = {
        return SearchViewController()
    }()
    
    lazy var shopCarVC: ShopCarViewController = {
        return ShopCarViewController()
    }()
    
    lazy var mineVC: MineViewController = {
        return MineViewController()
    }()
    
    lazy var homeNav:UINavigationController = {
        var nav: UINavigationController = UINavigationController(rootViewController: self.homeVC)
        nav.navigationBar.barTintColor = UIColor(red:0.8, green:0.13, blue:0.23, alpha:1)
        nav.navigationBar.shadowImage = UIImage()
        nav.navigationBar.translucent = false;
        return nav
    }()
    
    lazy var sortNav:UINavigationController = {
        return UINavigationController(rootViewController: self.sortVC)
        }()
    
    lazy var searchNav:UINavigationController = {
        return UINavigationController(rootViewController: self.searchVC)
        }()
    
    lazy var shopCarNav:UINavigationController = {
        return UINavigationController(rootViewController: self.shopCarVC)
        }()
    
    lazy var mineNav:UINavigationController = {
        return UINavigationController(rootViewController: self.mineVC)
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.viewControllers = [homeNav, sortNav, searchNav, shopCarNav, mineNav]
        
        self.setTabbarItemAppearance()
        
        
        self.view.backgroundColor = UIColor.whiteColor()
    }
    
    private func setTabbarItemAppearance() {
        self.homeVC.title = "首页"
        self.homeNav.tabBarItem.image = UIImage(named: "home_item_unselected")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        self.homeNav.tabBarItem.selectedImage = UIImage(named: "home_item_selected")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        
        self.sortVC.title = "分类"
        self.sortNav.tabBarItem.image = UIImage(named: "sort_item_unselected")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        self.sortNav.tabBarItem.selectedImage = UIImage(named: "sort_item_selected")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        
        self.searchVC.title = "筛选"
        self.searchNav.tabBarItem.image = UIImage(named: "search_item_unselected")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        self.searchNav.tabBarItem.selectedImage = UIImage(named: "search_item_selected")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        
        self.shopCarVC.title = "购物车"
        self.shopCarNav.tabBarItem.image = UIImage(named: "shop_car_item_unselected")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        self.shopCarNav.tabBarItem.selectedImage = UIImage(named: "shop_car_item_selected")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        
        self.mineVC.title = "我的"
        self.mineNav.tabBarItem.image = UIImage(named: "mine_item_unselected")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        self.mineNav.tabBarItem.selectedImage = UIImage(named: "mine_item_selected")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

