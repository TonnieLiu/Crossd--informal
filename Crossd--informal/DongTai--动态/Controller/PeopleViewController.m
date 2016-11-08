//
//  PeopleViewController.m
//  Crossd--informal
//
//  Created by D.Tong on 16/9/4.
//  Copyright © 2016年 practices. All rights reserved.
//

#import "PeopleViewController.h"

#import "CommonFiles.h"
#import "UserImageCell.h"

@interface PeopleViewController ()

@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,assign) long double itemInsetWidth;


@end

static NSString *identify = @"cell";

@implementation PeopleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _createCollectionView];

}

- (void)_createCollectionView{

    UICollectionViewFlowLayout *collectionLayout = [[UICollectionViewFlowLayout alloc] init];
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth  ,kScreenHeight ) collectionViewLayout:collectionLayout];
    
    _collectionView.backgroundColor = [UIColor whiteColor];
    
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    
    [self.view addSubview:_collectionView];
    
    //注册单元格
    [_collectionView registerClass:[UserImageCell class] forCellWithReuseIdentifier:identify];

}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return 50;

}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    UserImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor brownColor];
    
    return cell;

}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CGFloat itemWidth = (kScreenWidth - 5) / 4;
    
    return CGSizeMake(itemWidth, itemWidth);
    

}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{

    return 1;

}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{

    return 1;

}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
//    return UIEdgeInsetsMake(1, _itemInsetWidth, 1, _itemInsetWidth);
    return UIEdgeInsetsMake(0, 0, 1, 0);
    
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
