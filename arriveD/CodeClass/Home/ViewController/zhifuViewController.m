//
//  zhifuViewController.m
//  arriveD
//
//  Created by mibo02 on 17/7/11.
//  Copyright © 2017年 mibo02. All rights reserved.
//

#import "zhifuViewController.h"

@interface zhifuViewController ()

@end

@implementation zhifuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"支付详情";
}
- (IBAction)feiyongshuoming:(UIButton *)sender {
}

- (IBAction)backbtn:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


@end
