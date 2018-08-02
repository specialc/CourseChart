//
//  CYCourseChartTopView.m
//  CourseCharts
//
//  Created by dev on 2018/8/2.
//  Copyright © 2018年 chun. All rights reserved.
//

#import "CYCourseChartTopView.h"
#import "CYCourseChartCollectionViewCell.h"

@interface CYCourseChartTopView ()
@property (nonatomic, strong) UIView *regularView;
@property (nonatomic, strong) UIView *titleView;
@end

@implementation CYCourseChartTopView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubviews];
    }
    return self;
}

- (void)addSubviews {
    [self addSubview:self.regularView];
    [self addSubview:self.titleView];
    for (int i = 0; i < WeakDay; i++) {
        UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(i * ((self.titleView.frame.size.width - 1 * 8) / 7.0 + 1) + 1, 0, (self.titleView.frame.size.width - 1 * 8) / 7.0, self.titleView.frame.size.height)];
        label.text = [NSString stringWithFormat:@"周%d",i + 1];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor whiteColor];
        label.backgroundColor = [UIColor orangeColor];
        [self.titleView addSubview:label];
    }
}

- (UIView *)regularView {
    if (!_regularView) {
        _regularView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Regular_width, self.frame.size.height)];
        _regularView.backgroundColor = [UIColor whiteColor];
    }
    return _regularView;
}

- (UIView *)titleView {
    if (!_titleView) {
        _titleView = [[UIView alloc] initWithFrame:CGRectMake(Regular_width, 0, self.frame.size.width - Regular_width, self.frame.size.height)];
        _titleView.backgroundColor = [UIColor blackColor];
    }
    return _titleView;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
