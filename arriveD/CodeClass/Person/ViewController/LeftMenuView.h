//
//  LeftMenuView.h
//  arriveD
//
//  Created by mibo02 on 17/6/29.
//  Copyright © 2017年 mibo02. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HomeMenuViewDelegate <NSObject>

-(void)LeftMenuViewClick:(NSInteger)tag;
- (void)loginpersonclick;
- (void)selectedfooterbtnaction:(NSInteger)tag;
@end
@interface LeftMenuView : UIView

@property (nonatomic ,weak)id <HomeMenuViewDelegate> customDelegate;

@end
