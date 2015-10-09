//
//  UIView+AwakeNib.h
//  ShenKHealthy
//
//  Created by xiaofeishen on 15/7/22.
//  Copyright (c) 2015年 shenxiaofei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (AwakeNib)

+ (instancetype)sk_initFromNibName:(NSString *)nibName;

+ (instancetype)sk_viewFromNib;

+ (instancetype)sk_viewFromNibOwner:(id)own;

@end
