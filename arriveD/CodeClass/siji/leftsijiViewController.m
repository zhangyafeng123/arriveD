//
//  leftsijiViewController.m
//  arriveD
//
//  Created by mibo02 on 17/6/29.
//  Copyright © 2017年 mibo02. All rights reserved.
//

#import "leftsijiViewController.h"
#import "sijiCell.h"
@interface leftsijiViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableview;
@end

@implementation leftsijiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的司机";
    [self.tableview registerNib:[UINib nibWithNibName:@"sijiCell" bundle:nil] forCellReuseIdentifier:@"sijicell"];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    sijiCell *cell = [tableView dequeueReusableCellWithIdentifier:@"sijicell" forIndexPath:indexPath];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

@end
