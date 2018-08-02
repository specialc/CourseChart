//
//  CourseChartContentView.h
//  CourseCharts
//
//  Created by dev on 2018/8/2.
//  Copyright © 2018年 chun. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CourseChartContentView;
@protocol CourseChartContentViewDelegate <NSObject>

@optional

/**
 点击行事件
 
 @param timetableView CourseChartContentView
 @param row 当前行的索引值
 */
- (void)didSelect:(CourseChartContentView *)timetableView atRowPath:(NSUInteger)row;

@end

@interface CourseChartContentView : UIView

/**
 一些可选的方法，头部，点击事件等等
 */
@property(nonatomic,readwrite,weak)id<CourseChartContentViewDelegate> delegate;

@property (nonatomic, strong) NSMutableArray *dataSourceArray;
/**
 刷新当前控件所有元素
 */
- (void)reloadTimetableView;


/**
 刷新指定的行的样式
 
 @param row 指定行的索引值
 */
- (void)reloadTimetableViewFromRow:(NSUInteger)row;

/**
 滚动到指定行，默认的位置是:UITableViewScrollPositionTop
 动画:NO
 
 @param row 指定行的索引值
 */
- (void)scrollTimetableViewToRow:(NSUInteger)row;

@end
