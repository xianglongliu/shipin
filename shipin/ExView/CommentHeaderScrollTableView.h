//
//  CommentHeaderScrollTableView.h
//  movikr
//
//  Created by Mapollo25 on 15/5/20.
//  Copyright (c) 2015年 zeyuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommentHeaderCell.h"
#import "DramaModel.h"
#import "SimilaritiesModel.h"

@interface CommentHeaderScrollTableView : UIView<UICollectionViewDataSource,UICollectionViewDelegate>
{
    UIImage *imageOfUserLogoDefault;
}
@property (nonatomic,strong) DramaModel *dramaItem;
@property (nonatomic,strong) SimilaritiesModel *similaritiedItem;

@property (nonatomic,strong) NSMutableArray *userLogoList;
@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) UINavigationController *navigation;


- (instancetype)initWithFrame:(CGRect)frame viewerList:(NSMutableArray *)viewerList navigation:(UINavigationController *)navigation;
@end
