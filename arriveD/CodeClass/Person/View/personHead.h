//
//  personHead.h
//  arriveD
//
//  Created by mibo02 on 17/7/5.
//  Copyright © 2017年 mibo02. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol personHeaddelegate <NSObject>

- (void)selectedimagebtnaction:(UIButton *)sender;

@end


@interface personHead : UIView

@property (nonatomic, assign)id<personHeaddelegate>delegate;

- (instancetype)initWithFrame:(CGRect)frame imagestr:(NSString *)imagestr nickstr:(NSString *)nickname substr:(NSString *)substr;


@end
