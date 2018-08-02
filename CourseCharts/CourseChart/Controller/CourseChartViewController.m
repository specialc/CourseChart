//
//  CourseChartViewController.m
//  CourseCharts
//
//  Created by dev on 2018/8/2.
//  Copyright © 2018年 chun. All rights reserved.
//

#import "CourseChartViewController.h"
#import "CourseChartContentView.h"

@interface CourseChartViewController () <CourseChartContentViewDelegate>
@property (nonatomic, strong) CourseChartContentView *contentView;
@end

@implementation CourseChartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"课表";
    [self RQ_timetable];
    [self addSubviews];
}

- (void)addSubviews {
    [self.view addSubview:self.contentView];
}

- (CourseChartContentView *)contentView {
    if (!_contentView) {
        _contentView = [[CourseChartContentView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64)];
        _contentView.delegate = self;
    }
    return _contentView;
}


#pragma mark - CourseChartContentViewDelegate

- (void)didSelect:(CourseChartContentView *)timetableView atRowPath:(NSUInteger)row {
    NSLog(@"DidSelect Row:%ld",row);
}

#pragma mark - Button Action

- (void)buttonAction:(UIButton*)sender{
    NSLog(@"Button Row:%ld",sender.tag);
}

- (void)RQ_timetable {
    NSArray *array = @[
                       @{
                           @"WeekDay":@"1",
                           @"Schedules":@[
                                   @[
                                       @{
                                           @"YearCode":@"2018",
                                           @"TermCode":@"1",
                                           @"ClassId":@"4E6C89D8-DB6C-4D49-838D-81C7ECFADC25",
                                           @"WeekDay":@"1",
                                           @"CurriculumNumber":@"1",
                                           @"Detail":@"语文(1-18周)",
                                           },
                                       @{
                                           @"YearCode":@"2018",
                                           @"TermCode":@"1",
                                           @"ClassId":@"4E6C89D8-DB6C-4D49-838D-81C7ECFADC25",
                                           @"WeekDay":@"1",
                                           @"CurriculumNumber":@"1",
                                           @"Detail":@"语文(1-18周)",
                                           },
                                       ],
                                   @[
                                       @{
                                           @"YearCode":@"2018",
                                           @"TermCode":@"1",
                                           @"ClassId":@"4E6C89D8-DB6C-4D49-838D-81C7ECFADC25",
                                           @"WeekDay":@"1",
                                           @"CurriculumNumber":@"1",
                                           @"Detail":@"语文(1-18周)",
                                           },
                                       @{
                                           @"YearCode":@"2018",
                                           @"TermCode":@"1",
                                           @"ClassId":@"4E6C89D8-DB6C-4D49-838D-81C7ECFADC25",
                                           @"WeekDay":@"1",
                                           @"CurriculumNumber":@"1",
                                           @"Detail":@"语文(1-18周)",
                                           },
                                       ],
                                   @[
                                       @{
                                           @"YearCode":@"2018",
                                           @"TermCode":@"1",
                                           @"ClassId":@"4E6C89D8-DB6C-4D49-838D-81C7ECFADC25",
                                           @"WeekDay":@"1",
                                           @"CurriculumNumber":@"1",
                                           @"Detail":@"语文(1-18周)",
                                           },
                                       @{
                                           @"YearCode":@"2018",
                                           @"TermCode":@"1",
                                           @"ClassId":@"4E6C89D8-DB6C-4D49-838D-81C7ECFADC25",
                                           @"WeekDay":@"1",
                                           @"CurriculumNumber":@"1",
                                           @"Detail":@"语文(1-18周)",
                                           },
                                       ],
                                   @[
                                       @{
                                           @"YearCode":@"2018",
                                           @"TermCode":@"1",
                                           @"ClassId":@"4E6C89D8-DB6C-4D49-838D-81C7ECFADC25",
                                           @"WeekDay":@"1",
                                           @"CurriculumNumber":@"1",
                                           @"Detail":@"语文(1-18周)",
                                           },
                                       @{
                                           @"YearCode":@"2018",
                                           @"TermCode":@"1",
                                           @"ClassId":@"4E6C89D8-DB6C-4D49-838D-81C7ECFADC25",
                                           @"WeekDay":@"1",
                                           @"CurriculumNumber":@"1",
                                           @"Detail":@"语文(1-18周)",
                                           },
                                       ],
                                   @[
                                       @{
                                           @"YearCode":@"2018",
                                           @"TermCode":@"1",
                                           @"ClassId":@"4E6C89D8-DB6C-4D49-838D-81C7ECFADC25",
                                           @"WeekDay":@"1",
                                           @"CurriculumNumber":@"1",
                                           @"Detail":@"语文(1-18周)",
                                           },
                                       @{
                                           @"YearCode":@"2018",
                                           @"TermCode":@"1",
                                           @"ClassId":@"4E6C89D8-DB6C-4D49-838D-81C7ECFADC25",
                                           @"WeekDay":@"1",
                                           @"CurriculumNumber":@"1",
                                           @"Detail":@"语文(1-18周)",
                                           },
                                       ],
                                   @[
                                       @{
                                           @"YearCode":@"2018",
                                           @"TermCode":@"1",
                                           @"ClassId":@"4E6C89D8-DB6C-4D49-838D-81C7ECFADC25",
                                           @"WeekDay":@"1",
                                           @"CurriculumNumber":@"1",
                                           @"Detail":@"语文(1-18周)",
                                           },
                                       @{
                                           @"YearCode":@"2018",
                                           @"TermCode":@"1",
                                           @"ClassId":@"4E6C89D8-DB6C-4D49-838D-81C7ECFADC25",
                                           @"WeekDay":@"1",
                                           @"CurriculumNumber":@"1",
                                           @"Detail":@"语文(1-18周)",
                                           },
                                       ],
                                   
                                   ],
                           }
                       ];
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
