//
//  CYCourseChartViewController.m
//  CourseCharts
//
//  Created by dev on 2018/8/2.
//  Copyright © 2018年 chun. All rights reserved.
//

#import "CYCourseChartViewController.h"
#import "CYCourseChartContentView.h"

@interface CYCourseChartViewController ()
@property (nonatomic, strong) CYCourseChartContentView *contentView;
@end

@implementation CYCourseChartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addSubviews];
}

- (void)addSubviews {
    [self.view addSubview:self.contentView];
}

- (CYCourseChartContentView *)contentView {
    if (!_contentView) {
        _contentView = [[CYCourseChartContentView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64)];
        _contentView.backgroundColor = [UIColor greenColor];
    }
    return _contentView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
