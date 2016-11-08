//
//  PhotoTabBar.h
//  Crossd--informal
//
//  Created by D.Tong on 16/8/18.
//  Copyright © 2016年 practices. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PhotoTabBar;

@protocol PhotoTabBarDelegate <NSObject>

@optional

- (void)tabBarBtnClick:(PhotoTabBar *)tabBar;

@end

@interface PhotoTabBar : UITabBar

@property (nonatomic, weak) id<PhotoTabBarDelegate> myDelegate;

@end
