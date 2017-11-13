//
//  MoneyViewController.m
//  arriveD
//
//  Created by mibo02 on 17/7/7.
//  Copyright © 2017年 mibo02. All rights reserved.
//

#import "MoneyViewController.h"
#import "moneyhead.h"
#import "moneyCell.h"
#import "chongzhiViewController.h"
#import "youhuiquanViewController.h"
#import "jiaoyimingxiViewController.h"
#import "shenqingfapiaoViewController.h"
#import "zhifufangshiViewController.h"
@interface MoneyViewController ()<UITableViewDataSource,UITableViewDelegate,moneyheaddelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableivew;
@property (nonatomic, strong)NSArray *arr;
@property (nonatomic, strong)moneyhead *Head;
@end

@implementation MoneyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"钱包";
    self.arr = @[@"支付方式",@"优惠券",@"申请发票",@"交易明细"];
    [self.tableivew registerNib:[UINib nibWithNibName:@"moneyCell" bundle:nil] forCellReuseIdentifier:@"money"];
    self.Head = [[moneyhead alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 150) moneystr:@"18.00元"];
    self.Head.delegate = self;
    self.tableivew.tableHeaderView=self.Head;
}
//充值
- (void)selectedbtnaction:(UIButton *)sender
{
    chongzhiViewController *chongzhi = [chongzhiViewController new];
    [self.navigationController pushViewController:chongzhi animated:YES];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    moneyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"money" forIndexPath:indexPath];
    [cell.leftimg setImage:[UIImage imageNamed:self.arr[indexPath.row]] forState:(UIControlStateNormal)];
    cell.leftlab.text = self.arr[indexPath.row];
    cell.detaillab.text = @"0张";
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 1) {
        youhuiquanViewController *youhuiquan = [youhuiquanViewController new];
        [self.navigationController pushViewController:youhuiquan animated:YES];
    } else if (indexPath.row == 2){
        shenqingfapiaoViewController *shenqing = [shenqingfapiaoViewController new];
        [self.navigationController pushViewController:shenqing animated:YES];
    } else if(indexPath.row == 3){
        jiaoyimingxiViewController *jiaoyi = [jiaoyimingxiViewController new];
        [self.navigationController pushViewController:jiaoyi animated:YES];
    } else {
        //支付方式
        zhifufangshiViewController *zhifu  = [zhifufangshiViewController new];
        [self.navigationController pushViewController:zhifu animated:YES];
    }
}

@end
