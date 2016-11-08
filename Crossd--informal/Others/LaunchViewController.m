//
//  LaunchViewController.m
//  Crossd--informal
//
//  Created by D.Tong on 16/8/8.
//  Copyright © 2016年 practices. All rights reserved.
//

#import "LaunchViewController.h"
#import "CommonFiles.h"
#import "TabBarController.h"

@interface LaunchViewController ()

@property (nonatomic,strong)NSTimer *timer;

@end

@implementation LaunchViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self _createLaunchView];

}

- (void)_createLaunchView{

    UIImageView *launchImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    launchImgView.image = [UIImage imageNamed:@"LaunchImage-700-568h"];
    
    launchImgView.userInteractionEnabled = YES;
    [self.view addSubview:launchImgView];
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    [launchImgView addGestureRecognizer:singleTap];

    _timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(tapAction) userInfo:nil repeats:nil];
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    
    
}

- (void)tapAction{

    TabBarController *tabCtrl = [[TabBarController alloc] init];
    [self presentViewController:tabCtrl animated:YES completion:nil];
    
    [self.timer setFireDate:[NSDate distantFuture]];
    
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
