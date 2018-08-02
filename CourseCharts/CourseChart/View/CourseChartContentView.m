//
//  CourseChartContentView.m
//  CourseCharts
//
//  Created by dev on 2018/8/2.
//  Copyright © 2018年 chun. All rights reserved.
//

#import "CourseChartContentView.h"
#import "CourseChartTableViewCell.h"
#import "CourseChartHeaderView.h"

static NSString* const CellID = @"cellID";

@interface CourseChartContentView() <UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>
{
    CGFloat _lastScrollX; //Save scroll x position
}

@property(nonatomic,readwrite,strong)UITableView *stockTableView;
@property(nonatomic,readwrite,strong)UIScrollView *headScrollView;

@property (nonatomic, assign) CGFloat regularWidth;
@property (nonatomic, assign) CGFloat headHeight;

@property (nonatomic, strong) UILabel *regularLabel;
@property (nonatomic, strong) UIView *titleView;
@property (nonatomic, strong) CourseChartHeaderView *courseChartHeaderView;
@end

@implementation CourseChartContentView

@synthesize dataSourceArray = _dataSourceArray;

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self){
        self.regularWidth = CGRectGetWidth(self.regularLabel.frame);
        self.headHeight = 45.0f;
        _lastScrollX = 0;
        [self addSubviews];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.headScrollView.frame = CGRectMake(self.regularWidth,0,CGRectGetWidth(self.frame) - self.regularWidth, self.headHeight);
    self.headScrollView.contentSize = CGSizeMake(CGRectGetWidth(self.titleView.frame), self.headHeight);
}

#pragma mark - Setup

- (void)addSubviews {
    [self addSubview:self.stockTableView];
    
    [self.courseChartHeaderView addSubview:self.regularLabel];
    [self.courseChartHeaderView addSubview:self.headScrollView];
    [self.headScrollView addSubview:self.titleView];
    
    for (int i = 0; i < WeakDay; i++) {
        UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(i * Title_width, 0, Title_width, Title_height)];
        label.text = [NSString stringWithFormat:@"周%d",i + 1];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor grayColor];
        [self.titleView addSubview:label];
    }
}

- (UITableView *)stockTableView {
    if (!_stockTableView) {
        _stockTableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
        _stockTableView.backgroundColor = [UIColor yellowColor];
        _stockTableView.dataSource = self;
        _stockTableView.delegate = self;
        //        _stockTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_stockTableView registerClass:[CourseChartTableViewCell class] forCellReuseIdentifier:CellID];
    }
    return _stockTableView;
}

- (UIView *)regularLabel {
    if (!_regularLabel) {
        _regularLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, Regular_width, Regular_height)];
        _regularLabel.text = @"标题~~";
        _regularLabel.backgroundColor = [UIColor whiteColor];
        _regularLabel.textColor = [UIColor grayColor];
        _regularLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _regularLabel;
}

- (UIView *)titleView {
    if (!_titleView) {
        _titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width - Regular_width, Regular_height)];
        _titleView.backgroundColor = [UIColor colorWithRed:223.0f/255.0 green:223.0f/255.0 blue:223.0f/255.0 alpha:1.0];
    }
    return _titleView;
}

- (CourseChartHeaderView *)courseChartHeaderView {
    if (!_courseChartHeaderView) {
        _courseChartHeaderView = [[CourseChartHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, Regular_height)];
        _courseChartHeaderView.backgroundColor = [UIColor whiteColor];
    }
    return _courseChartHeaderView;
}

- (UIScrollView *)headScrollView {
    if (!_headScrollView) {
        _headScrollView = [[UIScrollView alloc] init];
        _headScrollView.backgroundColor = [UIColor redColor];
        _headScrollView.showsVerticalScrollIndicator = NO;
        _headScrollView.showsHorizontalScrollIndicator = NO;
        _headScrollView.delegate = self;
    }
    return _headScrollView;
}

#pragma mark - TableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CourseChartTableViewCell * cell = (CourseChartTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellID];
    cell.rightContentScrollView.delegate = self;
    
    __weak typeof(self) weakSelf = self;
    [cell setRightContentTapBlock:^(CourseChartTableViewCell *cell){
        __strong typeof(self) strongSelf = weakSelf;
        NSIndexPath* indexPath = [tableView indexPathForCell:cell];
        if ([strongSelf.delegate respondsToSelector:@selector(didSelect:atRowPath:)]) {
            [strongSelf.delegate didSelect:strongSelf atRowPath:indexPath.row];
        }
    }];
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return self.courseChartHeaderView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return Content_height;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return Regular_height;
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (scrollView == self.stockTableView) {
        [self scrollToLastScrollX];
    }
    else if (scrollView == self.headScrollView) {
        [self linkAgeScrollView:scrollView];
    }
    else {
        [self linkAgeScrollView:scrollView];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == self.stockTableView) {
        [self scrollToLastScrollX];
    }
    else if (scrollView == self.headScrollView) {
        [self linkAgeScrollView:scrollView];
    }
    else {
        [self linkAgeScrollView:scrollView];
    }
}

#pragma mark - Control Scroll

- (void)linkAgeScrollView:(UIScrollView*)sender {
    NSArray* visibleCells = [self.stockTableView visibleCells];
    for (CourseChartTableViewCell * cell in visibleCells) {
        if (cell.rightContentScrollView != sender) {
            cell.rightContentScrollView.delegate = nil;//disable send scrollViewDidScroll message
            [cell.rightContentScrollView setContentOffset:CGPointMake(sender.contentOffset.x, 0) animated:NO];
            cell.rightContentScrollView.delegate = self;//enable send scrollViewDidScroll message
        }
    }
    if (sender != self.headScrollView) {
        self.headScrollView.delegate = nil;//disable send scrollViewDidScroll message
        [self.headScrollView setContentOffset:CGPointMake(sender.contentOffset.x, 0) animated:NO];
        self.headScrollView.delegate = self;//enable send scrollViewDidScroll message
    }
    
    _lastScrollX = sender.contentOffset.x;
}

- (void)scrollToLastScrollX {
    NSArray* visibleCells = [self.stockTableView visibleCells];
    for (CourseChartTableViewCell *cell in visibleCells) {
        cell.rightContentScrollView.delegate = nil;//disable send scrollViewDidScroll message
        [cell.rightContentScrollView setContentOffset:CGPointMake(_lastScrollX, 0) animated:NO];
        cell.rightContentScrollView.delegate = self;//enable send scrollViewDidScroll message
    }
    
    self.headScrollView.delegate = nil;//disable send scrollViewDidScroll message
    [self.headScrollView setContentOffset:CGPointMake(_lastScrollX, 0) animated:NO];
    self.headScrollView.delegate = self;//enable send scrollViewDidScroll message
}

#pragma mark - Public

- (void)reloadTimetableView {
    [self.stockTableView reloadData];
    
    [self scrollToLastScrollX];
}

- (void)reloadTimetableViewFromRow:(NSUInteger)row {
    [self.stockTableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:row inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
    
    [self scrollToLastScrollX];
}

- (void)scrollTimetableViewToRow:(NSUInteger)row {
    [self.stockTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:row inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:NO];
}

#pragma mark - Property Getter

- (NSMutableArray *)dataSourceArray {
    if (!_dataSourceArray) {
        _dataSourceArray = [[NSMutableArray alloc] init];
    }
    return _dataSourceArray;
}

#pragma mark - Property Setter

- (void)setBackgroundColor:(UIColor *)backgroundColor {
    [super setBackgroundColor:backgroundColor];
    self.stockTableView.backgroundColor = backgroundColor;
}

- (void)setRegularWidth:(CGFloat)regularWidth {
    _regularWidth = regularWidth;
}

- (void)setHeadHeight:(CGFloat)headHeight {
    _headHeight = headHeight;
}

- (void)setDataSourceArray:(NSMutableArray *)dataSourceArray {
    _dataSourceArray = dataSourceArray;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
