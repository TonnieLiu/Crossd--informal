//
//  DynamicViewController.m
//  Crossd--informal
//
//  Created by D.Tong on 16/9/26.
//  Copyright © 2016年 practices. All rights reserved.
//

#import "DynamicViewController.h"

#import "PeopleViewController.h"
#import "DongTaiViewController.h"
#import "GuanZhuViewController.h"

@interface DynamicViewController ()

@end

@implementation DynamicViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationController.navigationBarHidden = YES;
    
    [self _setUpAllChildViewCtrl];//添加子控件


}

- (void)_setUpAllChildViewCtrl{

    PeopleViewController *peopleCtrl = [[PeopleViewController alloc] init];
    peopleCtrl.title = @"人";
    
    DongTaiViewController *dtCtrl = [[DongTaiViewController alloc] init];
    dtCtrl.title = @"动态";
    
    GuanZhuViewController *gzCtrl = [[GuanZhuViewController alloc] init];
    gzCtrl.title = @"关注";
    
    [self addChildViewController:peopleCtrl];
    [self addChildViewController:dtCtrl];
    [self addChildViewController:gzCtrl];
    
    
    

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
