//
//  CourseChartTableViewCell.h
//  CourseCharts
//
//  Created by dev on 2018/8/2.
//  Copyright © 2018年 chun. All rights reserved.
//

#import <UIKit/UIKit.h>

#define WeakDay 14

#define Regular_width 25.f
#define Regular_height 45.f

#define Title_width Content_width
#define Title_height Regular_height

#define Content_width 50.f
#define Content_height 100.f

@interface CourseChartTableViewCell : UITableViewCell

/**
 UITableViewCell的右边可滑动的ScrollView,设置成ReadOnly的目标就是对外使用，
 但是rightContentScrollView的生命周期由CYTimetableTableViewCell控制,可以设置Delegate，
 这样Cell和Controller之间就不用通讯，所有的UIScrollView事件都由CYTimetableView统一处理。
 */
@property(nonatomic,readonly,strong)UIScrollView *rightContentScrollView;


/**
 右边内容部分的点击事件Block
 */
@property(nonatomic,readwrite,copy)void (^rightContentTapBlock)(CourseChartTableViewCell *cell);


/**
 设置左边的自定义View
 */
@property(nonatomic,readwrite,strong)UIView *titleView;

/**
 设置右边可以滑动自定义View
 */
@property(nonatomic,readwrite,strong)UIView *rightContentView;

@end
