//
//  JTImagePageView.h
//  JTImagePageView
//
//  Created by John Tsai on 15/6/3.
//  Copyright (c) 2015年 John Tsai. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef  void (^DidSelectedImage)(NSUInteger index);

@class JTImagePageView;

@protocol JTImagePageViewDelegate
/**
 * imagePageView: didSelectIndex:
 *
 *  @param view  return the current imagePageView
 *  @param index return the selectIndex
 */
- (void)imagePageView:(JTImagePageView *)view didSelectIndex:(NSUInteger)index;

@end

@interface JTImagePageView : UIView
/**
 *  the image array
 */
@property (nonatomic, strong) NSArray *images;
/**
 *  the instance of JTImagePageViewDelegate
 */
@property (nonatomic, assign) id<JTImagePageViewDelegate> delegate;

@property (nonatomic, copy) DidSelectedImage didSelectedImage;

/**
 *  reload imagePageView data
 */
- (void)reloadData;

///**
// *  init with frame
// *
// *  @param frame the view frame
// *
// *  @return the view by frame
// */
//- (instancetype)initWithFrame:(CGRect)frame;
//
//- (instancetype)init;

@end
