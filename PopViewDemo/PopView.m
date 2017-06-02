//
//  weekDayView.m
//  NVRFunction
//
//  Created by foscom on 16/9/28.
//  Copyright © 2016年 zengjia. All rights reserved.
//

#import "PopView.h"
#define btn_base_tag  1000
#define RGB_ALERT(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]

@interface PopView ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UIWindow *backgroundWindow;
@property(nonatomic,strong)NSMutableArray *dataSource;
@property(nonatomic,strong)UITableView *tabview;

@end

@implementation PopView
{
   resultBlock resBlock;
}


+ (instancetype)sharePopViewWithString:(NSString *)string resultBlock:(resultBlock)resultBlock{

    PopView * popView = [[self alloc] initWithFrame:[UIScreen mainScreen].bounds];
    popView->resBlock = resultBlock;
    popView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.0];
    popView.backgroundWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [popView maketabView];
    [popView.backgroundWindow addSubview:popView];
    [popView.backgroundWindow becomeKeyWindow];
    [popView.backgroundWindow makeKeyAndVisible];
    [popView animationShowType];
    return popView;
}

// 隐藏
- (void)dismissWeekView
{
    [self animationHideType];
}

// 隐藏时动画
- (void)animationHideType{
    [UIView animateWithDuration:0.25 animations:^{
        self.tabview.transform = CGAffineTransformMakeScale(0.001, 0.001);
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.0];
    } completion:^(BOOL finished) {
        [self.backgroundWindow resignKeyWindow];
        [self removeFromSuperview];
    }];
}

// 显示时动画
- (void)animationShowType{
    [UIView animateWithDuration:0.2 animations:^{
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        self.tabview.transform = CGAffineTransformMakeScale(1, 1);
    }];
}


- (void)maketabView
{
     _tabview = [[UITableView alloc] initWithFrame:CGRectMake(25, 0, [UIScreen mainScreen].bounds.size.width -50, 44*4)];
    self.tabview.transform = CGAffineTransformMakeScale(0.001, 0.001);

    _dataSource = @[@"test1",@"test2",@"test3"].mutableCopy;
    
    _tabview.delegate = self;
    _tabview.dataSource = self;
    _tabview.center = self.center;
    _tabview.layer.cornerRadius = 5;
    _tabview.clipsToBounds = YES;
    _tabview.tableFooterView = [[UIView alloc] init];
    [self addSubview:_tabview];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self dismissWeekView];
}

#pragma mark ===============  tabview delegate   start  ===============

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataSource.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    [self dismissWeekView];
    resBlock?resBlock(_dataSource[indexPath.row]):nil;
    
}
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryNone;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 44.f;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 375, 44)];
    label.text = @"添加成功！请选择设备查看";
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:15];
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = RGB_ALERT(57, 97, 233);
    return label;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = _dataSource[indexPath.row];
    cell.textLabel.textColor = [UIColor colorWithRed:100/256. green:100/256. blue:100/256. alpha:1];
    cell.textLabel.font = [UIFont systemFontOfSize:16];
    
    return cell;
}
#pragma mark ===============   end   ===============



@end




