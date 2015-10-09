//
//  UIView+AwakeNib.m
//  ShenKHealthy
//
//  Created by xiaofeishen on 15/7/22.
//  Copyright (c) 2015年 shenxiaofei. All rights reserved.
//

#import "UIView+AwakeNib.h"

@implementation UIView (AwakeNib)

+(instancetype)sk_initFromNibName:(NSString *)nibName
{
    NSArray *objs = [[NSBundle mainBundle] loadNibNamed:nibName owner:nil options:0];
    return objs[0];
}

+ (instancetype)sk_viewFromNib
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] objectAtIndex:0];
}

+ (instancetype)sk_viewFromNibOwner:(id)own
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:own options:nil] objectAtIndex:0];
}

@end
