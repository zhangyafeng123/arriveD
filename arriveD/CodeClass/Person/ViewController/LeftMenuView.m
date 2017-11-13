//
//  LeftMenuView.m
//  arriveD
//
//  Created by mibo02 on 17/6/29.
//  Copyright © 2017年 mibo02. All rights reserved.
//
#define ImageviewWidth    18
#define Frame_Width       self.frame.size.width//200
#import "LeftMenuView.h"
#import "personHead.h"
#import "personFoot.h"
@interface LeftMenuView ()<UITableViewDelegate,UITableViewDataSource,personHeaddelegate>
@property (nonatomic ,strong)UITableView  *tableview;
@property (nonatomic, strong)UICollectionView *collectionView;
@property (nonatomic, strong)NSArray *imageArr;
@property (nonatomic, strong)NSArray *titleArr;
@property (nonatomic, strong)personHead *personH;
@property (nonatomic, strong)personFoot *personF;
@end

@implementation LeftMenuView

-(instancetype)initWithFrame:(CGRect)frame{
    
    if(self = [super initWithFrame:frame]){
        [self initView];
    }
    return  self;
}

-(void)initView{
    
    self.backgroundColor = [UIColor whiteColor];
    self.titleArr = @[@"行程",@"钱包",@"客服",@"设置"];
    
    self.tableview = [[UITableView alloc] initWithFrame:CGRectMake(20, 220, Frame_Width - 20, SCREEN_HEIGHT - 150 - 220)];
    self.tableview.scrollEnabled = NO;
    self.tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    [self addSubview:self.tableview];
    
    self.personH = [[personHead alloc] initWithFrame:CGRectMake(0, 0, 250, 220) imagestr:@"fengfeng" nickstr:@"乐在其中" substr:@"普通会员"];
    self.personH.delegate = self;
    [self addSubview:self.personH];
    
    self.personF = [[[NSBundle mainBundle] loadNibNamed:@"personFoot" owner:nil options:nil] firstObject];
    //200
    self.personF.frame = CGRectMake(0, SCREEN_HEIGHT - 120, 250, 200);
    [self.personF.topbtn addTarget:self action:@selector(footerbtnaction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.personF.firstbtn addTarget:self action:@selector(firstbtnaction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.personF.secondbtn addTarget:self action:@selector(firstbtnaction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.personF.thirdbtn addTarget:self action:@selector(firstbtnaction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.personF.fourbtn addTarget:self action:@selector(firstbtnaction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.personF.fivebtn addTarget:self action:@selector(firstbtnaction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self addSubview:self.personF];
    
}
- (void)firstbtnaction:(UIButton *)sender
{
    if ([self.customDelegate respondsToSelector:@selector(selectedfooterbtnaction:)]) {
        [self.customDelegate selectedfooterbtnaction:sender.tag - 150];
    }
}
- (void)selectedimagebtnaction:(UIButton *)sender
{
    if ([self.customDelegate respondsToSelector:@selector(loginpersonclick)]) {
        [self.customDelegate loginpersonclick];
    }
}
- (void)footerbtnaction:(UIButton *)sender
{
    sender.selected = !sender.selected;
    
    if (sender.isSelected) {
        self.personF.frame = CGRectMake(0, 220, 250, 200);
    } else {
        self.personF.frame = CGRectMake(0, SCREEN_HEIGHT - 120, 250, 200);
    }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titleArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *str = @"fengfeng";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:str];
    }
    cell.imageView.image = [UIImage imageNamed:self.titleArr[indexPath.row]];
    cell.selectionStyle = UITableViewCellSeparatorStyleNone;
    cell.textLabel.text = self.titleArr[indexPath.row];
   
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([self.customDelegate respondsToSelector:@selector(LeftMenuViewClick:)]){
        [self.customDelegate LeftMenuViewClick:indexPath.row];
    }
}

@end
