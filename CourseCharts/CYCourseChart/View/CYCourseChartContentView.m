//
//  CYCourseChartContentView.m
//  CourseCharts
//
//  Created by dev on 2018/8/2.
//  Copyright © 2018年 chun. All rights reserved.
//

#import "CYCourseChartContentView.h"
#import "CYCourseChartTopView.h"
#import "CYCourseChartLeftView.h"

static NSString *const kCell = @"kCell";

@interface CYCourseChartContentView () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, CYCourseChartLeftViewDelegate>
@property (nonatomic, assign) CGFloat lastScrollY;
@property (nonatomic, strong) CYCourseChartTopView *topView;
@property (nonatomic, strong) CYCourseChartLeftView *leftView;
@property (nonatomic, strong) UICollectionView *collectionView;
@end

@implementation CYCourseChartContentView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.lastScrollY = 0.0;
        [self addSubviews];
    }
    return self;
}

- (void)addSubviews {
    [self addSubview:self.topView];
    [self addSubview:self.leftView];
    [self addSubview:self.collectionView];
}

- (CYCourseChartTopView *)topView {
    if (!_topView) {
        _topView = [[CYCourseChartTopView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, Title_height)];
        _topView.backgroundColor = [UIColor redColor];
    }
    return _topView;
}

- (CYCourseChartLeftView *)leftView {
    if (!_leftView) {
        _leftView = [[CYCourseChartLeftView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.topView.frame), Regular_width, self.frame.size.height - CGRectGetMaxY(self.topView.frame))];
        _leftView.delegate = self;
        _leftView.backgroundColor = [UIColor yellowColor];
    }
    return _leftView;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.leftView.frame), CGRectGetMaxY(self.topView.frame), self.frame.size.width - CGRectGetMaxX(self.leftView.frame), self.frame.size.height - CGRectGetMaxY(self.topView.frame)) collectionViewLayout:({
            UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
            layout.minimumLineSpacing = 1;
            layout.minimumInteritemSpacing = 1;
            layout.sectionInset = UIEdgeInsetsMake(1, 1, 0, 1);
            layout.headerReferenceSize = CGSizeZero;
            layout.footerReferenceSize = CGSizeZero;
            
            // height：一定要 >= collectionViewCell的高度，如果有多个cell，要 >= 多个不同cell的高度的和。
            // 先不使用自动布局，如果使用自动布局，则隐藏itemSize，打开estimatedItemSize；
            //            layout.itemSize = CGSizeMake((375 - 1 * 8) / 7, 45);
            //            layout.estimatedItemSize = CGSizeMake((ScreenWidth - SCREENEDGE_MARGIN * 2 - SCREENEDGE_MARGIN_Ten) / 2, 264 * FIT_HEIGHT);
            
            layout;
        })];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        [_collectionView registerClass:[CYCourseChartCollectionViewCell class] forCellWithReuseIdentifier:kCell];
    }
    return _collectionView;
}

#pragma mark -

#pragma mark UICollectionViewDelegate

// dataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    //    return 1;
    return 14;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 7;
    //    return 7 * 14;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CYCourseChartCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCell forIndexPath:indexPath];
    cell.backgroundColor = [UIColor orangeColor];
    cell.titleLabel.text = [NSString stringWithFormat:@"%ld:%ld", (long)indexPath.section, (long)indexPath.row];
    
    return cell;
}

// delegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"didSelectItemAtIndexPath:section:%ld,row:%ld",(long)indexPath.section, (long)indexPath.row);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake((self.collectionView.frame.size.width - 1 * 8) / 7, Content_height);
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSLog(@"scrollViewDidEndDecelerating");
    [self linkAgeScrollView:scrollView];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"scrollViewDidScroll");
    [self linkAgeScrollView:scrollView];
}

#pragma mark - CYCourseChartLeftViewDelegate

- (void)leftView:(CYCourseChartLeftView *)contentView scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"leftView:scrollViewDidScroll:");
    [self scrollViewDidScroll:scrollView];
}

- (void)leftView:(CYCourseChartLeftView *)contentView scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSLog(@"leftView:scrollViewDidEndDecelerating:");
    [self scrollViewDidEndDecelerating:scrollView];
}

#pragma mark - Method

- (void)linkAgeScrollView:(UIScrollView *)sender {
    
    if (sender != self.collectionView) {
        self.collectionView.delegate = nil;//disable send scrollViewDidScroll message
        [self.collectionView setContentOffset:CGPointMake(0, sender.contentOffset.y) animated:NO];
        self.collectionView.delegate = self;//enable send scrollViewDidScroll message
    }
    
    if (sender != self.leftView.scrollView) {
        self.leftView.scrollView.delegate = nil;//disable send scrollViewDidScroll message
        [self.leftView.scrollView setContentOffset:CGPointMake(0, sender.contentOffset.y) animated:NO];
        self.leftView.scrollView.delegate = self;//enable send scrollViewDidScroll message
    }
    
    self.lastScrollY = sender.contentOffset.y;
}

#pragma mark - Setter

- (void)setLastScrollY:(CGFloat)lastScrollY {
    _lastScrollY = lastScrollY;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
