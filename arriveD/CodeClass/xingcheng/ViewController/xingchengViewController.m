//
//  xingchengViewController.m
//  arriveD
//
//  Created by mibo02 on 17/7/12.
//  Copyright © 2017年 mibo02. All rights reserved.
//

#import "xingchengViewController.h"
#import "xingchenglistViewController.h"
#import "fapiaoViewController.h"
@interface xingchengViewController ()

@end

@implementation xingchengViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的订单";
    
    NSArray *arr = @[@"全部",@"待支付",@"待接单",@"进行中",@"已完成",@"已取消"];
    NSMutableArray *newarr = [NSMutableArray new];
    for (int i = 0; i < 6; i++) {
        xingchenglistViewController *list = [xingchenglistViewController new];
        list.title = arr[i];
        [newarr addObject:list];
    }
     self.viewControllers = newarr;
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem initWithTitle:@"开发票" titleColor:[UIColor grayColor] target:self action:@selector(rightbaraction)];
}
- (void)rightbaraction
{
    fapiaoViewController *fapiao = [fapiaoViewController new];
    [self.navigationController pushViewController:fapiao animated:YES];
}


@end
