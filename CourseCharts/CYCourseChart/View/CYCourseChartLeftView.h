//
//  CYCourseChartLeftView.h
//  CourseCharts
//
//  Created by dev on 2018/8/2.
//  Copyright © 2018年 chun. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CYCourseChartLeftView;
@protocol CYCourseChartLeftViewDelegate <NSObject>

@optional
- (void)leftView:(CYCourseChartLeftView *)contentView viewDidTouch:(id)sender;

- (void)leftView:(CYCourseChartLeftView *)contentView scrollViewDidScroll:(UIScrollView *)scrollView;
- (void)leftView:(CYCourseChartLeftView *)contentView scrollViewDidEndDecelerating:(UIScrollView *)scrollView;

@end

@interface CYCourseChartLeftView : UIView
@property (nonatomic, weak) id<CYCourseChartLeftViewDelegate> delegate;
@property (nonatomic, strong) UIScrollView *scrollView;
@end
