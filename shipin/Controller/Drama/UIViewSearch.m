//
//  UIViewSearch.m
//  shipin
//
//  Created by Mapollo27 on 15/8/17.
//  Copyright (c) 2015年 dust.zhang. All rights reserved.
//

#import "UIViewSearch.h"

@implementation UIViewSearch

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        
        UISearchBar *searchBar = [[UISearchBar alloc ] initWithFrame:CGRectMake(10, 10, SCREEN_WIDTH-20, 30)];
        [searchBar setBackgroundColor:[UIColor whiteColor]];
        [self addSubview:searchBar];
        
        NSArray *arrayOne = [[NSArray alloc ] initWithObjects:@"新上线",@"最热门",@"收藏多", nil];
        for (int i = 0; i < 3; i++)
        {
            btnLine1[i] = [[UIButton alloc ] initWithFrame:CGRectMake(10+(i*43), searchBar.frame.size.height+searchBar.frame.origin.y+10, 40, 15)];
            [ btnLine1[i] setTitle:arrayOne[i] forState:UIControlStateNormal];
             btnLine1[i].titleLabel.font = [UIFont systemFontOfSize:10];
             btnLine1[i].layer.masksToBounds = YES;
             btnLine1[i].layer.cornerRadius =2;
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
        
        
        NSArray *arrayTwo = [[NSArray alloc ] initWithObjects:@"全部",@"美国",@"内地",@"香港",@"台湾",@"日本",@"韩国",@"英国",@"法国",@"其他", nil];

        for (int row = 0; row <2; row++)
        {
            for (int i = 0; i < 7; i++)
            {
                if ((row*7)+i < [arrayTwo count])
                {
                    btnLine2[(row*7)+i] = [[UIButton alloc ] initWithFrame:CGRectMake(10+(i*43),  btnLine1[0].frame.size.height+ btnLine1[0].frame.origin.y+10 +(row*25), 40, 15)];
                    [btnLine2[(row*7)+i] setTitle:arrayTwo[(row*7)+i] forState:UIControlStateNormal];
                    btnLine2[(row*7)+i].titleLabel.font = [UIFont systemFontOfSize:10];
                    btnLine2[(row*7)+i].layer.masksToBounds = YES;
                    btnLine2[(row*7)+i].layer.cornerRadius =2;
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
       
        
        NSArray *arrayThree = [[NSArray alloc ] initWithObjects:@"全部",@"剧情",@"喜剧",@"家庭",@"爱情",@"古装",@"偶像",
                             @"历史",@"悬疑",@"都市",@"恐怖",@"武侠",@"警匪",@"动画",
                             @"犯罪",@"动作",@"传记",@"纪录片",@"运动",@"歌舞",@"冒险",
                             @"奇幻",@"真人秀",@"其他",nil];
        
        for (int row = 0; row <4; row++)
        {
            for (int i = 0; i < 7; i++)
            {
                if ((row*7)+i < [arrayThree count])
                {
                    btnLine3[(row*7)+i] = [[UIButton alloc ] initWithFrame:CGRectMake(10+(i*43),  btnLine2[7].frame.size.height+ btnLine2[7].frame.origin.y+10 +(row*23), 40, 15)];
                    [btnLine3[(row*7)+i] setTitle:arrayThree[(row*7)+i] forState:UIControlStateNormal];
                    btnLine3[(row*7)+i].titleLabel.font = [UIFont systemFontOfSize:10];
                    btnLine3[(row*7)+i].layer.masksToBounds = YES;
                    btnLine3[(row*7)+i].layer.cornerRadius =2;
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

        NSArray *arrayFour = [[NSArray alloc ] initWithObjects:@"全部",@"2015年",@"2014年",@"2013年",@"2012年",@"2011年",@"更早", nil];
        for (int i = 0; i < 7; i++)
        {
            btnLine4[i] = [[UIButton alloc ] initWithFrame:CGRectMake(10+(i*43), btnLine3[22].frame.size.height+ btnLine3[22].frame.origin.y+10 , 40, 15)];
            [ btnLine4[i] setTitle:arrayFour[i] forState:UIControlStateNormal];
            btnLine4[i].titleLabel.font = [UIFont systemFontOfSize:10];
            btnLine4[i].layer.masksToBounds = YES;
            btnLine4[i].layer.cornerRadius =2;
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



@end
