//
//  JKPhotoBrowser.m
//  JKPhotoBrowser
//
//  Created by Jecky on 14/12/29.
//  Copyright (c) 2014年 Jecky. All rights reserved.
//

#import "JKPhotoBrowser.h"
#import "JKPhotoBrowserCell.h"
#import "ViewPostion.h"
#import "JKUtil.h"


@interface JKPhotoBrowser() <UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UIView   *topView;
@property (nonatomic, strong) UIView   *bottmView;
@end

static NSString *kJKPhotoBrowserCellIdentifier = @"kJKPhotoBrowserCellIdentifier";

@implementation JKPhotoBrowser

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [JKUtil getColor:@"282828"];
        self.autoresizesSubviews = YES;
        [self collectionView];
        [self createTopView];
    }
    return self;
}

- (void)closePhotoBrower
{
    [self hide];
}


#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.assetsArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    JKPhotoBrowserCell *cell = (JKPhotoBrowserCell *)[collectionView dequeueReusableCellWithReuseIdentifier:kJKPhotoBrowserCellIdentifier forIndexPath:indexPath];
    cell.asset = [self.assetsArray objectAtIndex:indexPath.row];
    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.bounds.size.width+20, self.bounds.size.height);
}


#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat offsetX = scrollView.contentOffset.x;
    float itemWidth = CGRectGetWidth(self.collectionView.frame);
    if (offsetX >= 0){
        int page = offsetX / itemWidth;
        [self didScrollToPage:page];
    }
}

- (void)didScrollToPage:(int)page
{
    _currentPage = page;
}


- (void)reloadPhotoeData
{
    [self.collectionView setContentOffset:CGPointMake(_currentPage*CGRectGetWidth(self.collectionView.frame), 0) animated:NO];
    [self.collectionView reloadData];
    
}

#pragma mark - setter
- (void)setAssetsArray:(NSMutableArray *)assetsArray
{
    if (_assetsArray != assetsArray)
    {
        _assetsArray = assetsArray;
        [self reloadPhotoeData];
    }
}

#pragma mark - getter
- (UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 0.0;
        layout.minimumInteritemSpacing = 0.0;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(-10, 0, self.bounds.size.width+20, self.bounds.size.height) collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor clearColor];
        [_collectionView registerClass:[JKPhotoBrowserCell class] forCellWithReuseIdentifier:kJKPhotoBrowserCellIdentifier];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.pagingEnabled = YES;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        [self addSubview:_collectionView];
        
    }
    return _collectionView;
}


- (void )createTopView
{
    _topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44)];
    _topView.backgroundColor = RGBA(0, 0, 0, 0.8);
    [self addSubview:_topView];
    
    //下面工具条
    _bottmView = [[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT-70,SCREEN_WIDTH, 70)];
    _bottmView.backgroundColor = RGBA(0, 0, 0, 0.8);
    [self addSubview:_bottmView];
    //    返回
    UIButton  *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(10, 13, 50, 50);
    [button setBackgroundImage:[UIImage imageNamed:@"btn_toback.png"] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"btn_toback_selected.png"] forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(closePhotoBrower) forControlEvents:UIControlEventTouchUpInside];
    [_bottmView addSubview:button];
}

- (void)show:(BOOL)animated
{
    if (animated)
    {
        self.hidden=YES;
        self.alpha=0;
        self.transform = CGAffineTransformMakeScale(1.3, 1.3);
        [[UIApplication sharedApplication].keyWindow addSubview:self];
        
        [UIView animateWithDuration:0.3
                         animations:^{
                             self.transform = CGAffineTransformMakeScale(1, 1);
                             self.hidden=NO;
                             self.alpha=1;
                         }completion:^(BOOL finish){
                             
                         }];
    }
    else
    {
        [[UIApplication sharedApplication].keyWindow addSubview:self];
    }
}

- (void)hide
{
    [UIView animateWithDuration:0.3
                     animations:^{
                         self.transform = CGAffineTransformMakeScale(1.3, 1.3);
                         self.hidden=NO;
                         self.alpha=0;
                     }completion:^(BOOL finish){
                         self.hidden = YES;
                         [self removeFromSuperview];
                     }];
}

@end
