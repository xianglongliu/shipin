//
//  UIViewSearch.m
//  shipin
//
//  Created by Mapollo27 on 15/8/17.
//  Copyright (c) 2015年 dust.zhang. All rights reserved.
//

#import "UIViewSearch.h"
#import "SearchViewController.h"

@implementation UIViewSearch
@synthesize delegate;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        
        UISearchBar *searchBar = [[UISearchBar alloc ] initWithFrame:CGRectMake(10, 10, SCREEN_WIDTH-20, 30)];
        [searchBar setBackgroundColor:[UIColor whiteColor]];
        searchBar.delegate = self;
        [self addSubview:searchBar];
        
        _arrayOne = [[NSArray alloc ] initWithObjects:@"新上线",@"最热门",@"收藏多", nil];
        for (int i = 0; i < 3; i++)
        {
            btnLine1[i] = [[UIButton alloc ] initWithFrame:CGRectMake(10+(i*43), searchBar.frame.size.height+searchBar.frame.origin.y+10, 40, 15)];
            [ btnLine1[i] setTitle:_arrayOne[i] forState:UIControlStateNormal];
             btnLine1[i].titleLabel.font = [UIFont systemFontOfSize:10];
             btnLine1[i].layer.masksToBounds = YES;
             btnLine1[i].layer.cornerRadius =2;
            btnLine1[i].tag = i;
            [btnLine1[i] addTarget:self action:@selector(onButtonOne:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview: btnLine1[i]];
            if (i ==0 )
            {
                [ btnLine1[i] setBackgroundColor:yellowRgb];
            }
            else
            {
                [ btnLine1[i] setBackgroundColor:[UIColor whiteColor]];
                [ btnLine1[i] setTitleColor:RGB(153, 153, 153) forState:UIControlStateNormal];
            }
        }
        _arrayTwo = [[NSArray alloc ] initWithObjects:@"全部",@"美国",@"内地",@"香港",@"台湾",@"日本",@"韩国",@"英国",@"法国",@"其他", nil];

        for (int row = 0; row <2; row++)
        {
            for (int i = 0; i < 7; i++)
            {
                if ((row*7)+i < [_arrayTwo count])
                {
                    btnLine2[(row*7)+i] = [[UIButton alloc ] initWithFrame:CGRectMake(10+(i*43),  btnLine1[0].frame.size.height+ btnLine1[0].frame.origin.y+10 +(row*25), 40, 15)];
                    [btnLine2[(row*7)+i] setTitle:_arrayTwo[(row*7)+i] forState:UIControlStateNormal];
                    btnLine2[(row*7)+i].titleLabel.font = [UIFont systemFontOfSize:10];
                    btnLine2[(row*7)+i].layer.masksToBounds = YES;
                    btnLine2[(row*7)+i].layer.cornerRadius =2;
                    btnLine2[(row*7)+i].tag = (row*7)+i;
                    [btnLine2[(row*7)+i] addTarget:self action:@selector(onButtonTwo:) forControlEvents:UIControlEventTouchUpInside];
                    [self addSubview:btnLine2[(row*7)+i]];
                    
                    if ((row*7)+i ==0 )
                    {
                        [ btnLine2[(row*7)+i] setBackgroundColor:yellowRgb];
                    }
                    else
                    {
                        [ btnLine2[(row*7)+i] setBackgroundColor:[UIColor whiteColor]];
                        [ btnLine2[(row*7)+i] setTitleColor:RGB(153, 153, 153) forState:UIControlStateNormal];
                    }

                }
            }
        }
       
        
       _arrayThree = [[NSArray alloc ] initWithObjects:@"全部",@"剧情",@"喜剧",@"家庭",@"爱情",@"古装",@"偶像",
                             @"历史",@"悬疑",@"都市",@"恐怖",@"武侠",@"警匪",@"动画",
                             @"犯罪",@"动作",@"传记",@"纪录片",@"运动",@"歌舞",@"冒险",
                             @"奇幻",@"真人秀",@"其他",nil];
        
        for (int row = 0; row <4; row++)
        {
            for (int i = 0; i < 7; i++)
            {
                if ((row*7)+i < [_arrayThree count])
                {
                    btnLine3[(row*7)+i] = [[UIButton alloc ] initWithFrame:CGRectMake(10+(i*43),  btnLine2[7].frame.size.height+ btnLine2[7].frame.origin.y+10 +(row*23), 40, 15)];
                    [btnLine3[(row*7)+i] setTitle:_arrayThree[(row*7)+i] forState:UIControlStateNormal];
                    btnLine3[(row*7)+i].titleLabel.font = [UIFont systemFontOfSize:10];
                    btnLine3[(row*7)+i].layer.masksToBounds = YES;
                    btnLine3[(row*7)+i].layer.cornerRadius =2;
                    btnLine3[(row*7)+i].tag = (row*7)+i;
                    [btnLine3[(row*7)+i] addTarget:self action:@selector(onButtonThree:) forControlEvents:UIControlEventTouchUpInside];
                    [self addSubview:btnLine3[(row*7)+i]];
                    
                    if ((row*7)+i ==0 )
                    {
                        [ btnLine3[(row*7)+i] setBackgroundColor:yellowRgb];
                    }
                    else
                    {
                        [ btnLine3[(row*7)+i] setBackgroundColor:[UIColor whiteColor]];
                        [ btnLine3[(row*7)+i] setTitleColor:RGB(153, 153, 153) forState:UIControlStateNormal];
                    }
                    
                }
            }
        }

        _arrayFour = [[NSArray alloc ] initWithObjects:@"全部",@"2015年",@"2014年",@"2013年",@"2012年",@"2011年",@"更早", nil];
        for (int i = 0; i < 7; i++)
        {
            btnLine4[i] = [[UIButton alloc ] initWithFrame:CGRectMake(10+(i*43), btnLine3[22].frame.size.height+ btnLine3[22].frame.origin.y+10 , 40, 15)];
            [ btnLine4[i] setTitle:_arrayFour[i] forState:UIControlStateNormal];
            btnLine4[i].titleLabel.font = [UIFont systemFontOfSize:10];
            btnLine4[i].layer.masksToBounds = YES;
            btnLine4[i].layer.cornerRadius =2;
            btnLine4[i].tag = i;
            [btnLine4[i] addTarget:self action:@selector(onButtonFour:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview: btnLine4[i]];
            if (i ==0 )
            {
                [ btnLine4[i] setBackgroundColor:yellowRgb];
            }
            else
            {
                [ btnLine4[i] setBackgroundColor:[UIColor whiteColor]];
                [ btnLine4[i] setTitleColor:RGB(153, 153, 153) forState:UIControlStateNormal];
            }
        }
    }
    return self;
}

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    if ([delegate respondsToSelector:@selector(pushToSearcheView)])
    {
        [delegate pushToSearcheView];
    }
    return FALSE;
}

-(void) onButtonOne:(UIButton *)sender
{
    NSLog(@"%ld",(long)sender.tag);
    for (int btnIndex=0; btnIndex < [_arrayOne count]; btnIndex++)
    {
        if (btnIndex == sender.tag)
        {
            [ btnLine1[btnIndex] setBackgroundColor:yellowRgb];
            [ btnLine1[btnIndex] setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
        else
        {
            [ btnLine1[btnIndex] setBackgroundColor:[UIColor whiteColor]];
            [ btnLine1[btnIndex] setTitleColor:RGB(153, 153, 153) forState:UIControlStateNormal];
        }
    }
}


-(void) onButtonTwo:(UIButton *)sender
{
    NSLog(@"%ld",(long)sender.tag);
    for (int btnIndex=0; btnIndex < [_arrayTwo count]; btnIndex++)
    {
        if (btnIndex == sender.tag)
        {
            [ btnLine2[btnIndex] setBackgroundColor:yellowRgb];
            [ btnLine2[btnIndex] setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
        else
        {
            [ btnLine2[btnIndex] setBackgroundColor:[UIColor whiteColor]];
            [ btnLine2[btnIndex] setTitleColor:RGB(153, 153, 153) forState:UIControlStateNormal];
        }
    }
}


-(void) onButtonThree:(UIButton *)sender
{
    NSLog(@"%ld",(long)sender.tag);
    for (int btnIndex=0; btnIndex < [_arrayThree count]; btnIndex++)
    {
        if (btnIndex == sender.tag)
        {
            [ btnLine3[btnIndex] setBackgroundColor:yellowRgb];
            [ btnLine3[btnIndex] setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
        else
        {
            [ btnLine3[btnIndex] setBackgroundColor:[UIColor whiteColor]];
            [ btnLine3[btnIndex] setTitleColor:RGB(153, 153, 153) forState:UIControlStateNormal];
        }
    }
}

-(void) onButtonFour:(UIButton *)sender
{
    NSLog(@"%ld",(long)sender.tag);
    for (int btnIndex=0; btnIndex < [_arrayFour count]; btnIndex++)
    {
        if (btnIndex == sender.tag)
        {
            [ btnLine4[btnIndex] setBackgroundColor:yellowRgb];
            [ btnLine4[btnIndex] setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
        else
        {
            [ btnLine4[btnIndex] setBackgroundColor:[UIColor whiteColor]];
            [ btnLine4[btnIndex] setTitleColor:RGB(153, 153, 153) forState:UIControlStateNormal];
        }
    }
}

@end
