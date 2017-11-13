//
//  personHead.m
//  arriveD
//
//  Created by mibo02 on 17/7/5.
//  Copyright © 2017年 mibo02. All rights reserved.
//

#import "personHead.h"

@implementation personHead

- (instancetype)initWithFrame:(CGRect)frame imagestr:(NSString *)imagestr nickstr:(NSString *)nickname substr:(NSString *)substr
{
    if ([super initWithFrame:frame]) {
        self.backgroundColor = [UIColor redColor];
        UIButton *imagebtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        imagebtn.frame = CGRectMake(95, 90, 60, 60);
        imagebtn.layer.cornerRadius = 30;
        imagebtn.layer.masksToBounds = YES;
        [imagebtn sd_setImageWithURL:[NSURL URLWithString:imagestr] forState:(UIControlStateNormal) placeholderImage:[UIImage imageNamed:@"3对话_03"]];
        [imagebtn addTarget:self action:@selector(btnaction:) forControlEvents:(UIControlEventTouchUpInside)];
        [self addSubview:imagebtn];
        UILabel *nicklab  = [[UILabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(imagebtn.frame) + 5, 250 - 40, 20)];
        nicklab.text = nickname;
        nicklab.font = H18;
        nicklab.textAlignment = NSTextAlignmentCenter;
        nicklab.textColor = [UIColor whiteColor];
        nicklab.backgroundColor = [UIColor clearColor];
        [self addSubview:nicklab];
        UILabel *sublab = [[UILabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(nicklab.frame), 250 - 40, 15)];
        sublab.textColor =[UIColor whiteColor];
        sublab.font = H13;
        sublab.text = substr;
        sublab.textAlignment = NSTextAlignmentCenter;
        sublab.backgroundColor = [UIColor clearColor];
        [self addSubview:sublab];
    }
    return self;
}

- (void)btnaction:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(selectedimagebtnaction:)]) {
        [self.delegate selectedimagebtnaction:sender];
    }
}

@end
