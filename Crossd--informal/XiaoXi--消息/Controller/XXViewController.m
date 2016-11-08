//
//  XXViewController.m
//  Crossd--informal
//
//  Created by D.Tong on 16/8/16.
//  Copyright © 2016年 practices. All rights reserved.
//

#import "XXViewController.h"

#import "InformationViewController.h"
#import "AttentionViewController.h"

@interface XXViewController ()

@end

@implementation XXViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationController.navigationBarHidden = YES;

    [self _setUpAllChildViewCtrl];//添加子控件

}

- (void)_setUpAllChildViewCtrl{
    
    InformationViewController *informCtrl = [[InformationViewController alloc] init];
    informCtrl.title = @"消息";
    
    AttentionViewController *attentionCtrl = [[AttentionViewController alloc] init];
    attentionCtrl.title = @"关注";
    
    [self addChildViewController:informCtrl];
    [self addChildViewController:attentionCtrl];
    
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
