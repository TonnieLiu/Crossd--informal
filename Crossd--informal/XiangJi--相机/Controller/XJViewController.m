//
//  XJViewController.m
//  Crossd--informal
//
//  Created by D.Tong on 16/8/16.
//  Copyright © 2016年 practices. All rights reserved.
//

#import "XJViewController.h"

#import "CommonFiles.h"

@interface XJViewController ()

@end

@implementation XJViewController

/*
- (void)viewWillLayoutSubviews{

    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"Crossd将要访问你的相册" preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    
        
    
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"没门儿" style:UIAlertActionStyleCancel handler:nil]];
    
    [self presentViewController:alert animated:YES completion:nil];

}
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //导航栏按钮
    [self _setUpItem];
    
}

- (void)_setUpItem{
    
    UINavigationBar *xjBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 64)];
    
    UINavigationItem *xjItem = [[UINavigationItem alloc] initWithTitle:@"动态"];
    
    
    UIBarButtonItem *issueItem = [[UIBarButtonItem alloc] initWithTitle:@"发布" style:UIBarButtonItemStyleDone target:self action:@selector(issueAction)];
    UIBarButtonItem *cancleItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(cancleAction)];
    
    [xjItem setLeftBarButtonItem:cancleItem];
    [xjItem setRightBarButtonItem:issueItem];
    
    [xjBar pushNavigationItem:xjItem animated:YES];

    [self.view addSubview:xjBar];
    
}

- (void)issueAction{
    
    NSLog(@"hfhffj");

}

- (void)cancleAction{

    [self dismissViewControllerAnimated:YES completion:nil];

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
