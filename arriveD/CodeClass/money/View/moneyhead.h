//
//  moneyhead.h
//  arriveD
//
//  Created by mibo02 on 17/7/12.
//  Copyright © 2017年 mibo02. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol moneyheaddelegate <NSObject>

- (void)selectedbtnaction:(UIButton *)sender;

@end

@interface moneyhead : UIView

@property (nonatomic, assign)id<moneyheaddelegate>delegate;

- (instancetype)initWithFrame:(CGRect)frame moneystr:(NSString *)moneystr;

@end
