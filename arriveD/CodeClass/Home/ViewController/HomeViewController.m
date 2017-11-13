//
//  HomeViewController.m
//  arriveD
//
//  Created by mibo02 on 17/6/29.
//  Copyright © 2017年 mibo02. All rights reserved.
//

#import "HomeViewController.h"
#import <MAMapKit/MAMapKit.h>
#import <AMapFoundationKit/AMapFoundationKit.h>
#import <AMapLocationKit/AMapLocationKit.h>
#import "adverView.h"
#import "adverViewController.h"

#import "HomesecondViewController.h"
#import "MenuView.h"
#import "cityViewController.h"
#import "LeftMenuView.h"
#import "HomeViewController.h"
#import "HomesecondViewController.h"
#import "loginViewController.h"
#import "xingchengViewController.h"
#import "kefuViewController.h"
#import "MoneyViewController.h"
#import "arrivesetViewController.h"
#import "lefttuijianViewController.h"
#import "leftMessageViewController.h"
#import "leftadressViewController.h"
#import "leftjifenViewController.h"
#import "leftsijiViewController.h"
#import <iflyMSC/iflyMSC.h>
@interface HomeViewController ()<AMapLocationManagerDelegate,MAMapViewDelegate,HomeMenuViewDelegate,IFlySpeechSynthesizerDelegate>
@property (nonatomic ,strong)MenuView *menu;
@property (weak, nonatomic) IBOutlet UIButton *leftbtn;
@property (weak, nonatomic) IBOutlet UIButton *rightbtn;
@property (weak, nonatomic) IBOutlet UIView *btnbackv;
@property (nonatomic, strong)UIView *backV;
@property(nonatomic,strong)MAMapView *mapView;
@property (nonatomic,strong)AMapLocationManager *locationManager;
@property (nonatomic,assign)CLLocationCoordinate2D currentCoordinate;//用来保存定位到的坐标
@property (nonatomic, strong)adverView *adverV;
@property (nonatomic, strong) IFlySpeechSynthesizer *iFlySpeechSynthesizer;
@end
@implementation HomeViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置地图
    [self setmap];
    [self createNav];
    //设置titlebtn
    [self settitlebtn];
    [self setingbtn];
    [self createadver];
    [self flyaction];
}
//语音
- (void)flyaction
{
    //获取语音合成单例
    _iFlySpeechSynthesizer = [IFlySpeechSynthesizer sharedInstance];
    //设置协议委托对象
    _iFlySpeechSynthesizer.delegate = self;
    //设置合成参数
    //设置在线工作方式
    [_iFlySpeechSynthesizer setParameter:[IFlySpeechConstant TYPE_CLOUD]
                                  forKey:[IFlySpeechConstant ENGINE_TYPE]];
    //设置音量，取值范围 0~100
    [_iFlySpeechSynthesizer setParameter:@"50"
                                  forKey: [IFlySpeechConstant VOLUME]];
    //发音人，默认为”xiaoyan”，可以设置的参数列表可参考“合成发音人列表”
    [_iFlySpeechSynthesizer setParameter:@"xiaoqian"
                                  forKey: [IFlySpeechConstant VOICE_NAME]];
    //保存合成文件名，如不再需要，设置为nil或者为空表示取消，默认目录位于library/cache下
    [_iFlySpeechSynthesizer setParameter:@"tts.pcm"
                                  forKey: [IFlySpeechConstant TTS_AUDIO_PATH]];
    //启动合成会话
    [_iFlySpeechSynthesizer startSpeaking: @"欢迎来到直到用户端"];
    
}
//IFlySpeechSynthesizerDelegate协议实现
//合成结束
- (void) onCompleted:(IFlySpeechError *) error {}
//合成开始
- (void) onSpeakBegin {}
//合成缓冲进度
- (void) onBufferProgress:(int) progress message:(NSString *)msg {}
//合成播放进度
- (void) onSpeakProgress:(int) progress beginPos:(int)beginPos endPos:(int)endPos {}


- (void)setingbtn
{
    self.btnbackv.layer.borderWidth = 0.5;
    self.btnbackv.layer.borderColor  = [UIColor redColor].CGColor;
    [self.leftbtn addTarget:self action:@selector(leftbtnaction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.rightbtn addTarget:self action:@selector(rightbtnaction:) forControlEvents:(UIControlEventTouchUpInside)];
}

- (void)leftbtnaction:(UIButton *)sender
{
    [self.leftbtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    self.leftbtn.backgroundColor = [UIColor redColor];
    [self.rightbtn setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
    self.rightbtn.backgroundColor = [UIColor whiteColor];
    HomesecondViewController *second = [HomesecondViewController new];
    [self.navigationController pushViewController:second animated:YES];
}
- (void)rightbtnaction:(UIButton *)sender
{
    [self.rightbtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    self.rightbtn.backgroundColor = [UIColor redColor];
    [self.leftbtn setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
    self.leftbtn.backgroundColor = [UIColor whiteColor];
    HomesecondViewController *second = [HomesecondViewController new];
    [self.navigationController pushViewController:second animated:YES];
}
- (void)settitlebtn
{
    UIButton *titleButton = [[MonTitleViewButton alloc] init];
    titleButton.titleLabel.textColor = [UIColor blackColor];
    titleButton.titleLabel.font = H15;
    [titleButton setImage:[UIImage imageNamed:@"下拉"] forState:(UIControlStateNormal)];
    [titleButton setTitle:@"深圳" forState:(UIControlStateNormal)];
    [titleButton setTitleColor:[UIColor grayColor] forState:(UIControlStateNormal)];
    [titleButton addTarget:self action:@selector(titleBtnAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [titleButton sizeToFit];
    self.navigationItem.titleView = titleButton;
}
- (void)createNav
{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem CreateItemWithTarget:self ForAction:@selector(leftBarButtonItemaction) WithImage:@"点击跳转至个人中心" WithHighlightImage:@""];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem CreateItemWithTarget:self ForAction:@selector(rightBarButtonItemaction) WithImage:@"信息列表" WithHighlightImage:@""];
    LeftMenuView *demo = [[LeftMenuView alloc]initWithFrame:CGRectMake(0, 0, 250, SCREEN_HEIGHT)];
    
    demo.customDelegate = self;
    
    self.menu = [[MenuView alloc]initWithDependencyView:self.view MenuView:demo isShowCoverView:YES];
}
- (void)titleBtnAction:(UIButton *)sender
{
    cityViewController *city = [cityViewController new];
    [self.navigationController pushViewController:city animated:YES];
    
}
- (void)leftBarButtonItemaction
{
    [self.menu show];
}
- (void)rightBarButtonItemaction
{
    //消息通知
    leftMessageViewController *message = [leftMessageViewController new];
    [self.navigationController pushViewController:message animated:YES];
}
-(void)LeftMenuViewClick:(NSInteger)tag{
    [self.menu hidenWithAnimation];
    
    if (tag == 0) {
        xingchengViewController *xingcheng = [xingchengViewController new];
        [self.navigationController pushViewController:xingcheng animated:YES];
    } else if (tag == 1){
        MoneyViewController *money = [MoneyViewController new];
        [self.navigationController pushViewController:money animated:YES];
    } else if (tag == 2){
        kefuViewController *kefu = [kefuViewController new];
        [self.navigationController pushViewController:kefu animated:YES];
    } else if (tag == 3){
        arrivesetViewController *setting = [arrivesetViewController new];
        [self.navigationController pushViewController:setting animated:YES];
    }
    
}
//登录
- (void)loginpersonclick
{
    [self.menu hidenWithAnimation];
    loginViewController *login = [loginViewController new];
    [self.navigationController pushViewController:login animated:YES];
}
//底部按钮点击
- (void)selectedfooterbtnaction:(NSInteger)tag
{
      [self.menu hidenWithAnimation];
    if (tag == 0) {
        //消息通知
        leftMessageViewController *message = [leftMessageViewController new];
        [self.navigationController pushViewController:message animated:YES];
    } else if (tag == 1){
        //推荐有奖
        lefttuijianViewController *tuijian = [lefttuijianViewController new];
        [self.navigationController pushViewController:tuijian animated:YES];
    } else if (tag == 2){
        //积分商城
        leftjifenViewController *jifen = [leftjifenViewController new];
        [self.navigationController pushViewController:jifen animated:YES];
    } else if (tag == 3){
        //我的地址
        leftadressViewController *adress = [leftadressViewController new];
        [self.navigationController pushViewController:adress animated:YES];
    } else {
        //我的司机
        leftsijiViewController *siji = [leftsijiViewController new];
        [self.navigationController pushViewController:siji animated:YES];
    }
}

- (void)setmap
{
    ///地图需要v4.5.0及以上版本才必须要打开此选项（v4.5.0以下版本，需要手动配置info.plist）
    [AMapServices sharedServices].enableHTTPS = YES;
    ///初始化地图
    _mapView = [[MAMapView alloc] initWithFrame:self.view.bounds];
    _mapView.delegate = self;
    //地图的缩放
    [_mapView setZoomLevel:18 animated:YES];
    //把地图放在底层
    [self.view insertSubview:self.mapView atIndex:0];
    
    //是否显示用户的位置
    _mapView.showsUserLocation = YES;
    //持续定位
    self.locationManager = [[AMapLocationManager alloc] init];
    self.locationManager.delegate = self;
    //开启持续定位
    [self.locationManager startUpdatingLocation];
}

//代理方法
-(void)amapLocationManager:(AMapLocationManager *)manager didUpdateLocation:(CLLocation *)location{
    //输出的是模拟器的坐标
    CLLocationCoordinate2D coordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude);
    _currentCoordinate = coordinate2D;
    _mapView.centerCoordinate = coordinate2D;

}
- (void)amapLocationManager:(AMapLocationManager *)manager didFailWithError:(NSError *)error{
    //定位错误
    NSLog(@"定位失败");
    NSLog(@"%s, amapLocationManager = %@, error = %@", __func__, [manager class], error);
}
- (void)createadver
{
    UIWindow *window = [UIApplication sharedApplication].windows[0];
    _backV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    _backV.backgroundColor =  RGBA(108, 108, 108,0.7);
    [window addSubview:_backV];
    _adverV = [[[NSBundle mainBundle] loadNibNamed:@"adverView" owner:nil options:nil] firstObject];
    [_adverV.deletebtn addTarget:self action:@selector(deletebtnaction:) forControlEvents:(UIControlEventTouchUpInside)];
    [_adverV.imgbtn addTarget:self action:@selector(imgbtnaction:) forControlEvents:(UIControlEventTouchUpInside)];
    _adverV.frame = CGRectMake((SCREEN_WIDTH - 300)/2, 100, 300, 450);
    [_backV addSubview:_adverV];
}

//广告点击事件
- (void)imgbtnaction:(UIButton *)sender
{
    [_backV removeFromSuperview];
    adverViewController *adver = [adverViewController new];
    [self.navigationController pushViewController:adver animated:YES];
}
//删除事件
- (void)deletebtnaction:(UIButton *)sender
{
    [_backV removeFromSuperview];
}


@end
