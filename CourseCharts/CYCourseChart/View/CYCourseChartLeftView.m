//
//  CYCourseChartLeftView.m
//  CourseCharts
//
//  Created by dev on 2018/8/2.
//  Copyright © 2018年 chun. All rights reserved.
//

#import "CYCourseChartLeftView.h"
#import "CYCourseChartCollectionViewCell.h"

@interface CYCourseChartLeftView () <UIScrollViewDelegate>

@end

@implementation CYCourseChartLeftView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubviews];
    }
    return self;
}

- (void)addSubviews {
    [self addSubview:self.scrollView];
    
    for (int i = 0; i < 14; i++) {
        UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(0, i * (Content_height + 1) + 1, Regular_width, Content_height)];
        label.font = [UIFont systemFontOfSize:10];
        label.text = [NSString stringWithFormat:@"%d节",i + 1];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor blackColor];
        label.backgroundColor = [UIColor whiteColor];
        [self.scrollView addSubview:label];
    }
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width, 14 * Content_height);
}

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        _scrollView.backgroundColor = [UIColor redColor];
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.delegate = self;
    }
    return _scrollView;
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if ([self.delegate respondsToSelector:@selector(leftView:scrollViewDidEndDecelerating:)]) {
        [self.delegate leftView:self scrollViewDidEndDecelerating:scrollView];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if ([self.delegate respondsToSelector:@selector(leftView:scrollViewDidScroll:)]) {
        [self.delegate leftView:self scrollViewDidScroll:scrollView];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
