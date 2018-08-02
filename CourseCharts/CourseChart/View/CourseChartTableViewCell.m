//
//  CourseChartTableViewCell.m
//  CourseCharts
//
//  Created by dev on 2018/8/2.
//  Copyright © 2018年 chun. All rights reserved.
//

#import "CourseChartTableViewCell.h"
#import "CourseChartScrollView.h"

@interface CourseChartTableViewCell() <UIScrollViewDelegate>
@property (nonatomic, strong) CourseChartScrollView *rightContentScrollView;
@property (nonatomic, strong) UILabel *titleLabel;
@end

@implementation CourseChartTableViewCell
- (void)dealloc {
    self.rightContentTapBlock = nil;
}

#pragma mark - Init

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupDefaultSettings];
        [self addSubviews];
    }
    return self;
}

#pragma mark - Layout

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.titleView.frame = CGRectMake(0, 0, CGRectGetWidth(self.titleView.frame), CGRectGetHeight(self.titleView.frame));
    
    id tempDelegate = _rightContentScrollView.delegate;
    self.rightContentScrollView.delegate = nil;//Do not send delegate message
    self.rightContentScrollView.frame = CGRectMake(CGRectGetWidth(self.titleView.frame), 0, CGRectGetWidth(self.frame) - CGRectGetWidth(self.titleView.frame), CGRectGetHeight(self.rightContentView.frame));
    
    
    //    self.rightContentScrollView.contentSize = CGSizeMake(CGRectGetWidth(self.rightContentView.frame), CGRectGetHeight(self.rightContentView.frame));
    self.rightContentScrollView.contentSize = CGSizeMake(1000, CGRectGetHeight(self.rightContentView.frame));
    
    
    self.rightContentScrollView.delegate = tempDelegate;//Restore deleagte
}

#pragma mark - Setup

- (void)setupDefaultSettings {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor whiteColor];
}

- (void)addSubviews {
    
    [self.contentView addSubview:self.titleView];
    [self.titleView addSubview:self.titleLabel];
    
    [self.contentView addSubview:self.rightContentScrollView];
    [self.rightContentScrollView addSubview:self.rightContentView];
    for (int i = 0; i < WeakDay; i++) {
        UIButton* button = [[UIButton alloc] initWithFrame:CGRectMake(i * Content_width, 0, Content_width, Content_height)];
        button.backgroundColor = [UIColor cyanColor];
        button.titleLabel.font = [UIFont systemFontOfSize:12];
        [button setTitle:[NSString stringWithFormat:@"内容:%d",i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        button.titleLabel.textAlignment = NSTextAlignmentCenter;
        button.tag = i;
        [self.rightContentView addSubview:button];
        //        self.rightContentView.frame = CGRectMake(self.rightContentView.frame.origin.x, self.rightContentView.frame.origin.y, CGRectGetMaxX(button.frame), self.rightContentView.frame.size.height);
    }
    
}

- (CourseChartScrollView *)rightContentScrollView {
    if (!_rightContentScrollView) {
        _rightContentScrollView = [[CourseChartScrollView alloc] init];
        _rightContentScrollView.canCancelContentTouches = YES;
        _rightContentScrollView.showsVerticalScrollIndicator = NO;
        _rightContentScrollView.showsHorizontalScrollIndicator = NO;
        _rightContentScrollView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        [_rightContentScrollView addGestureRecognizer:tapGesture];
    }
    return _rightContentScrollView;
}

- (UIView *)rightContentView {
    if (!_rightContentView) {
        _rightContentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width - Regular_width, Content_height)];
        _rightContentView.backgroundColor = [UIColor whiteColor];
    }
    return _rightContentView;
}

- (UIView *)titleView {
    if (!_titleView) {
        _titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Regular_width, Content_height)];
    }
    return _titleView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:self.titleView.bounds];
        _titleLabel.text = [NSString stringWithFormat:@"1"];
        _titleLabel.textColor = [UIColor grayColor];
        _titleLabel.backgroundColor = [UIColor colorWithRed:223.0f/255.0 green:223.0f/255.0 blue:223.0f/255.0 alpha:1.0];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}


#pragma mark - Tap

- (void)tapAction:(UITapGestureRecognizer *)gesture {
    if (self.rightContentTapBlock) {
        self.rightContentTapBlock(self);
    }
}

- (void)buttonAction:(UIButton*)sender{
    NSLog(@"Button Row:%ld",sender.tag);
}

#pragma mark -

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
