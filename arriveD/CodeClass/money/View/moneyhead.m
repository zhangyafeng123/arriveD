//
//  moneyhead.m
//  arriveD
//
//  Created by mibo02 on 17/7/12.
//  Copyright © 2017年 mibo02. All rights reserved.
//

#import "moneyhead.h"

@implementation moneyhead

- (instancetype)initWithFrame:(CGRect)frame moneystr:(NSString *)moneystr
{
    if ([super initWithFrame:frame]) {
        self.backgroundColor = [UIColor redColor];
        UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(30, 20, 100, 20)];
        lab.text = @"我的余额";
        lab.textColor = [UIColor whiteColor];
        lab.font = H15;
        lab.backgroundColor = [UIColor clearColor];
        [self addSubview:lab];
        UIButton *imagebtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        imagebtn.frame = CGRectMake(30, CGRectGetMaxY(lab.frame) + 20, 150, 40);
        [imagebtn setImage:[UIImage imageNamed:@"钱包 (2)"] forState:(UIControlStateNormal)];
        imagebtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [imagebtn setTitle:moneystr forState:(UIControlStateNormal)];
        imagebtn.titleLabel.font = H20;
        imagebtn.backgroundColor = [UIColor clearColor];
        [self addSubview:imagebtn];
        UIButton *chongzhibtn  = [UIButton buttonWithType:(UIButtonTypeCustom)];
        chongzhibtn.frame = CGRectMake(SCREEN_WIDTH - 100, CGRectGetMaxY(lab.frame) + 30, 80, 20);
        [chongzhibtn setTitle:@"立即充值" forState:(UIControlStateNormal)];
        chongzhibtn.backgroundColor = [UIColor whiteColor];
        chongzhibtn.titleLabel.font = H13;
        chongzhibtn.layer.cornerRadius = 4;
        chongzhibtn.layer.masksToBounds = YES;
        [chongzhibtn setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
         [chongzhibtn addTarget:self action:@selector(chongzhibtnaction:) forControlEvents:(UIControlEventTouchUpInside)];
        [self addSubview:chongzhibtn];
    }
    return self;
}
- (void)chongzhibtnaction:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(selectedbtnaction:)]) {
        [self.delegate selectedbtnaction:sender];
    }
}

@end
