//
//  AMProgressHUD.swift
//  AutoMall
//
//  Created by shenxiaofei on 15/9/30.
//  Copyright © 2015年 ZookParts. All rights reserved.
//

import UIKit

let delayTime:NSTimeInterval = 3.0 //默认延迟3秒

class AMProgressHUD: NSObject {
    
    private static let hud:MBProgressHUD = MBProgressHUD()
    
    private class func setHud(view:UIView,msg:String, hideAfter:NSTimeInterval) {
        hud.frame = view.bounds
        view.addSubview(hud)
        hud.mode = .CustomView;
        hud.labelText = msg
        hud.show(true)
        hud.hide(true, afterDelay: hideAfter)
    }
    
    private class func customImageV(imageName:String) -> UIView {
        var image = UIImage(named: imageName)
        if let _ = image {
            if image?.renderingMode != .AlwaysTemplate {
                image = image?.imageWithRenderingMode(.AlwaysTemplate)
            }
        }
        let imageView = UIImageView(image: image)
        imageView.contentMode = .Center
        imageView.tintColor = UIColor.whiteColor()
        imageView.frame = CGRect(x: 0,y: 0,width: 60,height: 30)
        
        let contentv = UIView(frame: CGRect(x: 0, y: 0, width: 60, height: 40))
        contentv.addSubview(imageView)
        return contentv
    }
    
    class func showWaiting(view:UIView) {
        MBProgressHUD.showHUDAddedTo(view, animated: true)
    }
    
    class func dismiss(view:UIView) {
        MBProgressHUD.hideHUDForView(view, animated: true)
    }
    
    class func showSuccess(msg:String) {
        showSuccess(UIApplication.sharedApplication().keyWindow!, msg: msg)
    }
    
    class func showSuccess(view:UIView, msg:String) {
        showSuccess(view, msg:msg, hideAfter:delayTime)
    }
    
    class func showSuccess(view:UIView, msg:String, hideAfter:NSTimeInterval) {
        hud.customView = customImageV("progresshud_success")
        setHud(view,msg:msg,hideAfter:hideAfter)
    }
    
    class func showFailed(msg:String) {
        showFailed(UIApplication.sharedApplication().keyWindow!, msg: msg)
    }
    
    class func showFailed(view:UIView, msg:String) {
        showFailed(view, msg:msg, hideAfter:delayTime)
    }
    
    class func showFailed(view:UIView, msg:String, hideAfter:NSTimeInterval) {
        hud.customView = customImageV("progresshud_error")
        setHud(view,msg:msg,hideAfter:hideAfter)
    }
    
    class func showInfo(msg:String) {
        showInfo(UIApplication.sharedApplication().keyWindow!, msg: msg)
    }
    
    class func showInfo(view:UIView, msg:String) {
        showInfo(view, msg:msg, hideAfter:delayTime)
    }
    
    class func showInfo(view:UIView, msg:String, hideAfter:NSTimeInterval) {
        hud.customView = customImageV("progresshud_info")
        setHud(view,msg:msg,hideAfter:hideAfter)
    }
}
