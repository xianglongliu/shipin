//
//  CommentHeaderScrollTableView.m
//  movikr
//
//  Created by Mapollo25 on 15/5/20.
//  Copyright (c) 2015年 zeyuan. All rights reserved.
//

#import "CommentHeaderScrollTableView.h"
#import "DramaDetialViewController.h"


NSString *const cellIdentifier=@"HorzonItemCell";

@interface CommentHeaderScrollTableView(){
    
}

@end

///评论头部滚动视图
@implementation CommentHeaderScrollTableView

-(instancetype)initWithFrame:(CGRect)frame viewerList:(NSMutableArray *)viewerList navigation:(UINavigationController *)navigation
{
    self=[super initWithFrame:frame];
    self.navigation = navigation;
    //初始化数据
    self.userLogoList=viewerList;
    if(self)
    {
        imageOfUserLogoDefault=[UIImage imageNamed:nil];
        [self initTableView];
    }
    return self;
}

-(void) initTableView{
    CGRect rect = CGRectMake(0, 0, self.frame.size.width, 150);
    
    UICollectionViewFlowLayout *horizontalCellLayout=[UICollectionViewFlowLayout new];
    horizontalCellLayout.scrollDirection=UICollectionViewScrollDirectionHorizontal;
    horizontalCellLayout.sectionInset = UIEdgeInsetsMake(0, 15, 0, 0);
    horizontalCellLayout.minimumInteritemSpacing=15;
    horizontalCellLayout.minimumLineSpacing=horizontalCellLayout.minimumInteritemSpacing;
    
    self.collectionView=[[UICollectionView alloc]initWithFrame:rect collectionViewLayout:horizontalCellLayout];
    [self.collectionView registerClass:[CommentHeaderCell class] forCellWithReuseIdentifier:cellIdentifier];
    self.collectionView.showsHorizontalScrollIndicator=NO;
    self.collectionView.dataSource=self;
    self.collectionView.delegate=self;
    [self.collectionView setBackgroundColor:[UIColor clearColor]];
    [self addSubview:self.collectionView];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.userLogoList count];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CommentHeaderCell *cell;
    cell=[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    self.similaritiedItem =[self.userLogoList objectAtIndex:indexPath.row];

    if(self.similaritiedItem)
    {
        if([self.similaritiedItem.cover length] != 0)
            [cell.imageView sd_setImageWithURL:[Tool stringMerge:self.similaritiedItem.cover] placeholderImage:nil];
        else
              [cell.imageView sd_setImageWithURL:[NSURL URLWithString:netWorkUrl] placeholderImage:nil];
      
        [cell.labelName setText:self.similaritiedItem.name];
    }
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((SCREEN_WIDTH-60)/3, 200);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld",(long)indexPath.row);
    self.similaritiedItem =[self.userLogoList objectAtIndex:indexPath.row];
    
    DramaDetialViewController *dramaDetialView=[[DramaDetialViewController alloc]init];
    dramaDetialView.nId=[[self.similaritiedItem.Id stringValue] intValue];
    [self.navigation pushViewController:dramaDetialView animated:YES];
    
}

-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}


@end
