//
//  ViewController.m
//  CourseCharts
//
//  Created by dev on 2018/8/2.
//  Copyright © 2018年 chun. All rights reserved.
//

#import "ViewController.h"
#import "CourseChartViewController.h"
#import "CYCourseChartViewController.h"

static NSString* const kCellID = @"kCellID";

@interface ViewController ()  <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"课表";
    [self addSubviews];
}

- (void)addSubviews {
    [self.view addSubview:self.tableView];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64) style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorColor = [UIColor blackColor];
        _tableView.estimatedRowHeight = self.view.frame.size.height;
        _tableView.sectionHeaderHeight = 0;
        _tableView.sectionFooterHeight = 0;
    }
    return _tableView;
}

#pragma mark -

#pragma mark - UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellID];
        cell.backgroundColor = [UIColor cyanColor];
    }
    
    if (indexPath.row == 0) {
        cell.textLabel.text = @"课表：tableView";
    }
    else if (indexPath.row == 1) {
        cell.textLabel.text = @"课表：collectionView";
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    if (indexPath.row == 0) {
        CourseChartViewController *courseChartViewController = [[CourseChartViewController alloc] init];
        [self.navigationController pushViewController:courseChartViewController animated:YES];
    }
    else if (indexPath.row == 1) {
        CYCourseChartViewController *cyCourseChartViewController = [[CYCourseChartViewController alloc] init];
        [self.navigationController pushViewController:cyCourseChartViewController animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
