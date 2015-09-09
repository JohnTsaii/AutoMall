//
//  JTImagePageView.m
//  JTImagePageView
//
//  Created by John Tsai on 15/6/3.
//  Copyright (c) 2015年 John Tsai. All rights reserved.
//

#import "JTImagePageView.h"
#import "JTImageViewCell.h"

static NSString *const identifier = @"JTImageViewCellID";

@interface JTImagePageView ()
<UICollectionViewDataSource,UICollectionViewDelegate> {
    @private
    NSTimer *_timer;
}

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UIPageControl *pageControl;

@end

@implementation JTImagePageView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setUp];
    }
    return self;
}

- (void)setUp {
    // set collectionview flow layout
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
    layout.itemSize = self.frame.size;
    
    // init collectionview
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.frame collectionViewLayout:layout];
    self.collectionView.dataSource = self;
    self.collectionView.pagingEnabled = YES;
    self.collectionView.delegate = self;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.contentSize = CGSizeMake(MAXFLOAT, CGRectGetHeight(self.frame));
    [self addSubview:self.collectionView];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"JTImageViewCell" bundle:nil] forCellWithReuseIdentifier:identifier];
    
    // init page control
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.frame) - 20, CGRectGetWidth(self.frame), 20)];
    self.pageControl.pageIndicatorTintColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
//    self.pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
    self.pageControl.hidesForSinglePage = YES;
    [self addSubview:self.pageControl];
    
    // init timer
//    _timer = [NSTimer timerWithTimeInterval:2 target:self selector:@selector(timer:) userInfo:nil repeats:YES];
}

- (CGSize)intrinsicContentSize  {
    return CGSizeMake(375, 200);
}

// timer event
- (void)timer:(NSTimer *)timer {
    if (self.images.count > 1) {
        NSUInteger page = self.pageControl.currentPage;
        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:++page  inSection:0]atScrollPosition:UICollectionViewScrollPositionRight animated:YES];
        
        ++ self.pageControl.currentPage;
    }
}


#pragma mark -
#pragma mark UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.images.count ;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    JTImageViewCell *cell = (JTImageViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    cell.imageView.image = [self.images objectAtIndex:indexPath.row % self.images.count];
    
    return cell;
}

#pragma mark -
#pragma mark UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
        [self.delegate imagePageView:self didSelectIndex:indexPath.row - 1];
}

/**
 *  this is another way to implementation infinite scroll
 */
//- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
//    float contentOffsetWhenFullyScrolledRight = self.collectionView.frame.size.width * ([self.images count] -1);
//    float offsetX = scrollView.contentOffset.x;
//    NSLog(@"%f",offsetX);
//    if (scrollView.contentOffset.x == contentOffsetWhenFullyScrolledRight) {
//        
//        // user is scrolling to the right from the last item to the 'fake' item 1.
//        // reposition offset to show the 'real' item 1 at the left-hand end of the collection view
//        
//        NSIndexPath *newIndexPath = [NSIndexPath indexPathForItem:1 inSection:0];
//        
//        [self.collectionView scrollToItemAtIndexPath:newIndexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
//        
//    } else if (scrollView.contentOffset.x == 0)  {
//        
//        // user is scrolling to the left from the first item to the fake 'item N'.
//        // reposition offset to show the 'real' item N at the right end end of the collection view
//        
//        NSIndexPath *newIndexPath = [NSIndexPath indexPathForItem:([self.images count] -2) inSection:0];
//        
//        [self.collectionView scrollToItemAtIndexPath:newIndexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
//        
//    }
//}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (scrollView.contentOffset.x == 0) {
        if (self.images.count > 1)
        self.pageControl.currentPage = self.images.count - 2;
        return;
    }
    
    if (scrollView.contentOffset.x == self.collectionView.frame.size.width) {
        self.pageControl.currentPage = 0;
    }
    
    if (scrollView.contentOffset.x == self.collectionView.frame.size.width * self.images.count) {
        self.pageControl.currentPage = 0;
        return;
    }
    
    self.pageControl.currentPage = (scrollView.contentOffset.x - self.collectionView.frame.size.width) / self.collectionView.frame.size.width;
}

- (void) scrollViewDidScroll:(UIScrollView *)scrollView {
    if (self.images.count <= 1)
        return;
    
    static CGFloat lastContentOffsetX = FLT_MIN;
    
    // We can ignore the first time scroll,
    // because it is caused by the call scrollToItemAtIndexPath: in ViewWillAppear
    if (FLT_MIN == lastContentOffsetX) {
        lastContentOffsetX = scrollView.contentOffset.x;
        return;
    }
    
    CGFloat currentOffsetX = scrollView.contentOffset.x;
    CGFloat currentOffsetY = scrollView.contentOffset.y;
    
    CGFloat pageWidth = scrollView.frame.size.width;
    CGFloat offset = pageWidth * (self.images.count - 2);
    
    // the first page(showing the last item) is visible and user is still scrolling to the left
    if (currentOffsetX < pageWidth && lastContentOffsetX > currentOffsetX) {
        lastContentOffsetX = currentOffsetX + offset;
        scrollView.contentOffset = (CGPoint){lastContentOffsetX, currentOffsetY};
    }
    // the last page (showing the first item) is visible and the user is still scrolling to the right
    else if (currentOffsetX > offset && lastContentOffsetX < currentOffsetX) {
        lastContentOffsetX = currentOffsetX - offset;
        scrollView.contentOffset = (CGPoint){lastContentOffsetX, currentOffsetY};
    } else {
        lastContentOffsetX = currentOffsetX;
    }
}



#pragma mark -
#pragma mark ReloadData
- (void)reloadData {
    if (self.images.count > 1) {
        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:1 inSection:0]atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
        self.pageControl.numberOfPages = self.images.count - 2;
        self.pageControl.currentPage = 0;
        
//        [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    }
    
    [self.collectionView reloadData];
}

#pragma mark -
#pragma mark SetDataArray
- (void)setImages:(NSArray *)images {
    if (images.count <= 1) {
        _images = images;
        return;
    }
    
    NSMutableArray *array = [NSMutableArray arrayWithArray:images];
    [array addObject:[images firstObject]];
    [array insertObject:[images lastObject] atIndex:0];
    _images = [NSArray arrayWithArray:array];
    
    [self reloadData];
}

- (void)dealloc {
    [_timer invalidate];
    _timer = nil;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
