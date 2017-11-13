//
//  youhuiquanViewController.m
//  arriveD
//
//  Created by mibo02 on 17/7/12.
//  Copyright © 2017年 mibo02. All rights reserved.
//

#import "youhuiquanViewController.h"
#import "youhuiquanCell.h"
@interface youhuiquanViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableview;

@end

@implementation youhuiquanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"优惠券";
    [self.tableview registerNib:[UINib nibWithNibName:@"youhuiquanCell" bundle:nil] forCellReuseIdentifier:@"youhuiquan"];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    youhuiquanCell *cell = [tableView dequeueReusableCellWithIdentifier:@"youhuiquan" forIndexPath:indexPath];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
