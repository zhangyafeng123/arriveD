//
//  loginViewController.m
//  arriveD
//
//  Created by mibo02 on 17/7/7.
//  Copyright © 2017年 mibo02. All rights reserved.
//

#import "loginViewController.h"

@interface loginViewController (){
    //定时器
    NSTimer *timer;
    NSInteger verificationTime;//重新获取验证码时间;
}
@property (weak, nonatomic) IBOutlet UITextField *phone;
@property (weak, nonatomic) IBOutlet UITextField *tujianphone;
@property (weak, nonatomic) IBOutlet UITextField *yanzhengM;
@property (weak, nonatomic) IBOutlet UILabel *getyanzhenglab;
@property (weak, nonatomic) IBOutlet UIButton *getyanzhengbtn;
@end

@implementation loginViewController
//登录
- (IBAction)loginbtnaction:(UIButton *)sender
{
    if (self.phone.text.length == 0) {
        [MBProgressHUD showError:@"请输入手机号"];
        return;
    }
    if (self.yanzhengM.text.length == 0) {
        [MBProgressHUD showError:@"请输入验证码"];
        return;
    }
    [self showProgressHUD];
    [NetWorkManager requestForPostWithUrl:loginURL parameter:@{@"mobile":self.phone.text,@"code":self.yanzhengM.text,@"role":@"client"} success:^(id reponseObject) {
        if ([reponseObject[@"code"] integerValue] == 1) {
            [self.navigationController popToRootViewControllerAnimated:YES];
        }
        [MBProgressHUD showError:reponseObject[@"msg"]];
        [self hideProgressHUD];
    } failure:^(NSError *error) {
        
    }];
}
//获取验证码
- (IBAction)getyanzhengmaAction:(UIButton *)sender
{
    if (self.phone.text.length == 0) {
        [MBProgressHUD showError:@"请输入手机号"];
        return;
    }
    [NetWorkManager requestForPostWithUrl:getyanzhengmaURL parameter:@{@"mobile":self.phone.text} success:^(id reponseObject) {
        if ([reponseObject[@"code"] integerValue] == 1) {
            _yanzhengM.text = reponseObject[@"result"];
            _getyanzhenglab.text = [NSString stringWithFormat:@"%ld(s)",verificationTime];
            timer  = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
        }
        [MBProgressHUD showError:reponseObject[@"msg"]];
        
    } failure:^(NSError *error) {
        
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登录";
    //刚开始60秒
    verificationTime = 60;
    self.getyanzhenglab.layer.cornerRadius = 4;
    self.getyanzhenglab.layer.masksToBounds = YES;
    self.getyanzhenglab.layer.borderWidth = 0.5;
    self.getyanzhenglab.layer.borderColor = [UIColor redColor].CGColor;
}
- (void)timerAction:(NSTimer *)sender
{
    verificationTime -= 1;
    if (verificationTime == 0) {
        [timer invalidate];
        timer = nil;
        verificationTime = 60;
        _getyanzhengbtn.hidden = NO;
        _getyanzhenglab.text = @"获取验证码";
    } else {
        _getyanzhenglab.text = [NSString stringWithFormat:@"%ld(s)",verificationTime];
    }
}
//当视图将要消失的时候销毁定时器
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [timer invalidate];
    timer = nil;
}

@end
