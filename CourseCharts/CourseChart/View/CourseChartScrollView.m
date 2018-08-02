//
//  CourseChartScrollView.m
//  CourseCharts
//
//  Created by dev on 2018/8/2.
//  Copyright © 2018年 chun. All rights reserved.
//

#import "CourseChartScrollView.h"

@implementation CourseChartScrollView

/**
 重写touchesShouldCancelInContentView方法，
 达到当Button作为子View时，可正常滑动
 
 @param view UIView
 @return 如果返回YES，当前的UIView可以一起滑动，如果NO,当前会拦截滑动事件
 */
- (BOOL)touchesShouldCancelInContentView:(UIView *)view {
    if ( [view isKindOfClass:[UIButton class]] ) {
        return YES;
    }
    
    return [super touchesShouldCancelInContentView:view];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
