//
//  TabBarController.m
//  Crossd--informal
//
//  Created by D.Tong on 16/8/18.
//  Copyright © 2016年 practices. All rights reserved.
//

#import "TabBarController.h"
#import "NavigationController.h"

#import "CommonFiles.h"
#import "PhotoTabBar.h"
#import "UIImage+Image.h"

//#import "DTViewController.h"
#import "DynamicViewController.h"
#import "XXViewController.h"
#import "XJViewController.h"
#import "HTViewController.h"
#import "WoViewController.h"

@interface TabBarController ()<PhotoTabBarDelegate>

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    //加载子控制器
    [self _setUpAllChildCtrl];
    
    //自定义tabbar，用kvc将自己的tabbar替换下
    PhotoTabBar *tabbar = [[PhotoTabBar alloc]init];
    tabbar.myDelegate = self;
    //kvc修开了系统的tabBar
    [self setValue:tabbar forKey:@"tabBar"];

}

- (void)_setUpAllChildCtrl{
    
    DynamicViewController *dtCtrl = [[DynamicViewController alloc] init];
    [self setUpOneChildCtrlWithVCtrl:dtCtrl Image:@"tabar_page@2x" selectedImg:@"tabar_page_select@2x" title:@"首页"];
    
    XXViewController *xxCtrl = [[XXViewController alloc] init];
    [self setUpOneChildCtrlWithVCtrl:xxCtrl Image:@"tabar_message@2x" selectedImg:@"tabar_message_select@2x" title:@"消息"];
    
    HTViewController *htCtrl = [[HTViewController alloc] init];
    [self setUpOneChildCtrlWithVCtrl:htCtrl Image:@"find@2x" selectedImg:@"find_select@2x" title:@"话题广场"];
    
    WoViewController *woCtrl = [[WoViewController alloc] init];
    [self setUpOneChildCtrlWithVCtrl:woCtrl Image:@"tabar_wo@2x" selectedImg:@"tabar_wo_select@2x" title:@"我"];
  
}

/**
 *  tabar上单个按钮的设置的封装
 *
 *  @param viewCtrl 每个按钮对应的控制器
 *  @param imgName  按钮普通状态下的图片
 *  @param selImg   按钮选中状态下的图片
 *  @param title    按钮对应的名字
 */

- (void)setUpOneChildCtrlWithVCtrl:(UIViewController *)viewCtrl Image:(NSString *)imgName selectedImg:(NSString *)selImg title:(NSString *)title{

    NavigationController *nav = [[NavigationController alloc] initWithRootViewController:viewCtrl];
    
//    viewCtrl.view.backgroundColor = [self randomColor];
    
    UIImage *myImg = [UIImage imageNamed:imgName];
   
    //图片渲染效果imageWithRenderingMode
    myImg = [myImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    viewCtrl.tabBarItem.image = myImg;
    
    //选中按钮图片
    UIImage *mySelImg = [UIImage imageNamed:selImg];
    mySelImg = [mySelImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    viewCtrl.tabBarItem.selectedImage = mySelImg;
    
    //按底下下文字及导航栏名字
    viewCtrl.tabBarItem.title = title;
    viewCtrl.navigationItem.title = title;
    
    [self addChildViewController:nav];

}

- (void)tabBarBtnClick:(PhotoTabBar *)tabBar{

    XJViewController *xjCtrl = [[XJViewController alloc] init];
    xjCtrl.view.backgroundColor = [self randomColor];
    
//    NavigationController *navCtl = [[NavigationController alloc] initWithRootViewController:xjCtrl];
    [self presentViewController:xjCtrl animated:YES completion:nil];

}

//随机背景颜色
- (UIColor *)randomColor
{
    CGFloat r = arc4random_uniform(256);
    CGFloat g = arc4random_uniform(256);
    CGFloat b = arc4random_uniform(256);
    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
