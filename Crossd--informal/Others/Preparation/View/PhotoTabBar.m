//
//  PhotoTabBar.m
//  Crossd--informal
//
//  Created by D.Tong on 16/8/18.
//  Copyright © 2016年 practices. All rights reserved.
//

//#define MAS_SHORTHAND
//#define MAS_SHORTHAND_GLOBALS

#import "PhotoTabBar.h"
#import <objc/runtime.h>
#import "UIImage+Image.h"
#import "UIView+LBExtension.h"

@interface PhotoTabBar ()

@property (nonatomic, weak)UIButton *photoBtn;

@end

@implementation PhotoTabBar

- (instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        
        UIButton *photoBtn1 = [[UIButton alloc] init];
        [photoBtn1 setBackgroundImage:[UIImage imageNamed:@"tabar_photo@2x"] forState:UIControlStateNormal];
        
        self.photoBtn = photoBtn1;
        
        [photoBtn1 addTarget:self action:@selector(photoBtnDidClick) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:photoBtn1];

    }

    return self;
}

- (void)layoutSubviews{

    [super layoutSubviews];
    
    //找出之前设置的按钮 UITabBarButton，重新排列位置，空出中的位置
    Class class = NSClassFromString(@"UITabBarButton");
    
    self.photoBtn.centerX = self.centerX;
    self.photoBtn.centerY = self.height * 0.5  ;
    
    self.photoBtn.size = CGSizeMake(self.photoBtn.currentBackgroundImage.size.width, self.photoBtn.currentBackgroundImage.size.height);
    
    int btnIndex = 0;
    for (UIView *btn in self.subviews) {
        
        //遍历tabbar的子控制器
        if ([btn isKindOfClass:class]) {
            
            //如果是系统的ttabbarBtn，就调整子空间的位置，空出中间位置
            btn.width = self.width / 5 ;
            btn.x = btn.width *btnIndex;
            btnIndex ++ ;
            
            //如果btnIndex是2,直接++，目的是空出中间位置，让出相机按钮的位置
            if (btnIndex == 2) {
                btnIndex ++;
            }
        }
        
    }
    
//    [_photoBtn ]
    
    [self bringSubviewToFront:self.photoBtn];
}

//点击了相机按钮
- (void)photoBtnDidClick{

    //如果tabbar的代理实现了代理方法，调用代理的该方法
    if ([self.delegate respondsToSelector:@selector(tabBarBtnClick:)]) {
        [self.myDelegate tabBarBtnClick:self];
    }

}

@end
