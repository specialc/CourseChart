//
//  CYCourseChartCollectionViewCell.h
//  CourseCharts
//
//  Created by dev on 2018/8/2.
//  Copyright © 2018年 chun. All rights reserved.
//

#import <UIKit/UIKit.h>

#define WeakDay 7

#define Regular_width 25.f
#define Regular_height 45.f

#define Title_width Content_width
#define Title_height Regular_height

#define Content_width 50.f
#define Content_height 100.f

@interface CYCourseChartCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong) UILabel *titleLabel;
@end
