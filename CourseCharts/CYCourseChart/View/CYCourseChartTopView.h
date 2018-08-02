//
//  CYCourseChartTopView.h
//  CourseCharts
//
//  Created by dev on 2018/8/2.
//  Copyright © 2018年 chun. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CYCourseChartTopView;
@protocol CYCourseChartTopViewDelegate <NSObject>

@optional
- (void)topView:(CYCourseChartTopView *)contentView viewDidTouch:(id)sender;

@end

@interface CYCourseChartTopView : UIView
@property (nonatomic, weak) id<CYCourseChartTopViewDelegate> delegate;
@end
