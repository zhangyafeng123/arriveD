//
//  jiaoyimingxiViewController.m
//  arriveD
//
//  Created by mibo02 on 17/7/12.
//  Copyright © 2017年 mibo02. All rights reserved.
//

#import "jiaoyimingxiViewController.h"

@interface jiaoyimingxiViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableview;

@end

@implementation jiaoyimingxiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"交易明细";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
        static NSString *str = @"fengfeng";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:str];
    }
    cell.backgroundColor  = [UIColor whiteColor];
    cell.textLabel.text = [NSString stringWithFormat:@"今天\n06-08"];
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.font = H15;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"-10.00\n订单支出"];
    cell.detailTextLabel.numberOfLines = 0;
    cell.detailTextLabel.font = H14;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

@end
