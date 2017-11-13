//
//  HomesecondViewController.m
//  arriveD
//
//  Created by mibo02 on 17/7/10.
//  Copyright © 2017年 mibo02. All rights reserved.
//

#import "HomesecondViewController.h"
#import "jingjialistViewController.h"
#import "putongfourCell.h"
#import "putongfirstCell.h"
#import "putongsecondCell.h"
#import "shiyongViewController.h"
#import "zhifuViewController.h"
#import "leftsijiViewController.h"
#import "orderfirstViewController.h"
@interface HomesecondViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (nonatomic, strong)NSArray *leftarr;
@property (nonatomic, strong)NSArray *rightarr;
@property (nonatomic, strong)UITextField *textf;
@property (nonatomic, strong)LTTextView *textv;
@property (nonatomic, strong)UIView *backV;
@property (weak, nonatomic) IBOutlet UIView *bottomview;
@end

@implementation HomesecondViewController

- (IBAction)zhifudetailbtn:(UIButton *)sender
{
    zhifuViewController *zhifu = [zhifuViewController new];
    [self.navigationController pushViewController:zhifu animated:YES];
}


- (IBAction)paybtn:(UIButton *)sender
{
    orderfirstViewController *first = [orderfirstViewController new];
    [self.navigationController pushViewController:first animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"快件";
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem initWithTitle:@"使用须知" titleColor:[UIColor grayColor] target:self action:@selector(rightbaraction)];
    
    self.leftarr = @[@"物品重量",@"取货时间",@"送达时间"];
    self.rightarr = @[@"选择物品重量",@"立即取货",@"11:00"];
    [self.tableview registerNib:[UINib nibWithNibName:@"putongfirstCell" bundle:nil] forCellReuseIdentifier:@"first"];
    [self.tableview registerNib:[UINib nibWithNibName:@"putongsecondCell" bundle:nil] forCellReuseIdentifier:@"second"];
    [self.tableview registerNib:[UINib nibWithNibName:@"putongfourCell" bundle:nil] forCellReuseIdentifier:@"four"];
}



- (void)rightbaraction
{
    shiyongViewController *shiyong = [shiyongViewController new];
    [self.navigationController pushViewController:shiyong animated:YES];
}

- (IBAction)fabuaction:(UIButton *)sender
{
    jingjialistViewController *jingjia = [jingjialistViewController new];
    [self.navigationController pushViewController:jingjia animated:YES];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    } else if (section == 1){
        return 2;
    } else if (section == 2){
        return 3;
    } else if (section == 3){
        return 2;
    }else {
        return 1;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        putongfirstCell  *cell = [tableView dequeueReusableCellWithIdentifier:@"first" forIndexPath:indexPath];
        return cell;
    } else if (indexPath.section == 1){
        putongsecondCell *cell = [tableView dequeueReusableCellWithIdentifier:@"second" forIndexPath:indexPath];
        _textv = [[LTTextView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(cell.leftbtn.frame) + 5, 5, SCREEN_WIDTH - cell.leftbtn.frame.size.width - 50, 60)];
        _textv.tag = indexPath.row + 100;
        if (indexPath.row == 0) {
            [cell.leftbtn setTitle:@"发货地址" forState:(UIControlStateNormal)];
            cell.leftview.backgroundColor = [UIColor redColor];
            _textv.placeholderTextView.text = @"请输入发货地址";
        } else {
            [cell.leftbtn setTitle:@"收货地址" forState:(UIControlStateNormal)];
            cell.leftview.backgroundColor = [UIColor greenColor];
            _textv.placeholderTextView.text = @"请输入收货地址";
        }
        [cell.contentView addSubview:_textv];
        return cell;
    } else if (indexPath.section == 2){
        static NSString *str = @"fengfeng";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
        if (!cell) {
            cell  = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:str];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.font = H14;
        cell.detailTextLabel.font = H14;
        cell.textLabel.text = self.leftarr[indexPath.row];
        cell.imageView.image = [UIImage imageNamed:self.leftarr[indexPath.row]];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.detailTextLabel.text = self.rightarr[indexPath.row];
        return cell;
    } else if(indexPath.section == 3){
        static NSString *str = @"newfengfeng";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:str];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        if (indexPath.row ==1) {
            
            cell.textLabel.text = @"备注留言";
            cell.imageView.image = [UIImage imageNamed:@"备注留言"];
            _textf= [[UITextField alloc] initWithFrame:CGRectMake(150, 5, SCREEN_WIDTH - 170, 35)];
            _textf.placeholder = @"补充信息";
            _textf.font = H14;
            _textf.borderStyle = UITextBorderStyleNone;
            _textf.textAlignment = NSTextAlignmentRight;
            [cell.contentView addSubview:_textf];
        } else {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.textLabel.text = @"我的司机";
            cell.imageView.image = [UIImage imageNamed:@"我的司机"];
            cell.detailTextLabel.text = @"优先推送";
        }
        cell.textLabel.font = H14;
        cell.detailTextLabel.font = H14;
        return cell;
    } else {
        putongfourCell *cell = [tableView dequeueReusableCellWithIdentifier:@"four" forIndexPath:indexPath];
        return cell;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 150;
    } else if (indexPath.section == 1){
        return 70;
    } else if (indexPath.section == 2 || indexPath.section ==3){
        return 45;
    } else {
        return 130;
    }
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 15)];
    view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    return view;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 15;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 2) {
         if (indexPath.row == 0){
            UITableViewCell *cell  = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:2]];
            
            UIWindow *window = [UIApplication sharedApplication].windows[0];
            _backV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
            _backV.backgroundColor =  RGBA(108, 108, 108,0.7);
            [window addSubview:_backV];
            
            [CDZPicker showPickerInView:_backV withStrings:@[@"5",@"6",@"7",@"10"] confirm:^(NSArray<NSString *> *stringArray) {
                [_backV removeFromSuperview];
                cell.detailTextLabel.text = stringArray.firstObject;
            }cancel:^{
                //your code
                [_backV removeFromSuperview];
            }];
        } else {
            UITableViewCell *cell  = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:2]];
            
            UIWindow *window = [UIApplication sharedApplication].windows[0];
            _backV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
            _backV.backgroundColor =  RGBA(108, 108, 108,0.7);
            [window addSubview:_backV];
            
            [CDZPicker showPickerInView:_backV withStringArrays:@[@[@"今天"],@[@"立即取货",@"10点",@"11点",@"12点"],@[@"00分",@"10分",@"20分"]] confirm:^(NSArray<NSString *> *stringArray) {
                  [_backV removeFromSuperview];
                cell.detailTextLabel.text = [stringArray componentsJoinedByString:@"-"];
            } cancel:^{
                  [_backV removeFromSuperview];
            }];
        }
    } else if (indexPath.section == 3){
        if (indexPath.row == 0) {
            leftsijiViewController *siji = [leftsijiViewController new];
            [self.navigationController pushViewController:siji animated:YES];
        }
    }
}

@end
