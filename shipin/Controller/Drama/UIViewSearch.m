//
//  UIViewSearch.m
//  shipin
//
//  Created by Mapollo27 on 15/8/17.
//  Copyright (c) 2015年 dust.zhang. All rights reserved.
//

#import <LKDBHelper/LKDBHelper.h>
#import "UIViewSearch.h"
#import "SearchViewController.h"


@implementation UIViewSearch
@synthesize delegate;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {

        _strType = @"1";
        _strCountry = @"0";
        _strPlot= @"0";
        _strYear= @"0";
        
        DramaTags *tag = [[DramaTags alloc] init];
        tag.id=0;
        tag.name=@"全部";

        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        
        UISearchBar *searchBar = [[UISearchBar alloc ] initWithFrame:CGRectMake(10, 10, SCREEN_WIDTH-20, 30)];
        [searchBar setBackgroundColor:[UIColor whiteColor]];
        searchBar.delegate = self;
        [self addSubview:searchBar];
        
        _arrayOne = [[NSMutableArray alloc] init];
        [_arrayOne addObjectsFromArray:[self getTags:@(1)]];
        for (int i = 0; i < 3; i++)
        {
            btnLine1[i] = [[UIButton alloc ] initWithFrame:CGRectMake(10+(i*43), searchBar.frame.size.height+searchBar.frame.origin.y+10, 40, 15)];
            [ btnLine1[i] setTitle:[_arrayOne[i] name] forState:UIControlStateNormal];
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

        _arrayTwo = [[NSMutableArray alloc] init];
        [_arrayTwo addObject:tag];
        [_arrayTwo addObjectsFromArray:[self getTags:@(2)]];

        for (int row = 0; row <2; row++)
        {
            for (int i = 0; i < 7; i++)
            {
                if ((row*7)+i < [_arrayTwo count])
                {
                    btnLine2[(row*7)+i] = [[UIButton alloc ] initWithFrame:CGRectMake(10+(i*43),  btnLine1[0].frame.size.height+ btnLine1[0].frame.origin.y+10 +(row*25), 40, 15)];
                    [btnLine2[(row*7)+i] setTitle:[_arrayTwo[(row * 7) + i] name] forState:UIControlStateNormal];
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


        _arrayThree = [[NSMutableArray alloc] init];
        [_arrayThree addObject:tag];
        [_arrayThree addObjectsFromArray:[self getTags:@(3)]];
        
//       _arrayThree = [[NSArray alloc ] initWithArray:[self getTags:@(3)]];
        
        for (int row = 0; row <4; row++)
        {
            for (int i = 0; i < 7; i++)
            {
                if ((row*7)+i < [_arrayThree count])
                {
                    btnLine3[(row*7)+i] = [[UIButton alloc ] initWithFrame:CGRectMake(10+(i*43),  btnLine2[7].frame.size.height+ btnLine2[7].frame.origin.y+10 +(row*23), 40, 15)];
                    [btnLine3[(row*7)+i] setTitle:[_arrayThree[(row * 7) + i] name] forState:UIControlStateNormal];
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

        _arrayFour = [[NSMutableArray alloc] init];
        [_arrayFour addObject:tag];
        [_arrayFour addObjectsFromArray:[self getTags:@(4)]];
//        _arrayFour = [[NSArray alloc ] initWithArray:[self getTags:@(4)]];
        for (int i = 0; i < [_arrayFour count]; i++)
        {
            btnLine4[i] = [[UIButton alloc ] initWithFrame:CGRectMake(10+(i*43), btnLine3[22].frame.size.height+ btnLine3[22].frame.origin.y+10 , 40, 15)];
            [ btnLine4[i] setTitle:[_arrayFour[i] name] forState:UIControlStateNormal];
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
            _tagModle =  [_arrayOne objectAtIndex:btnIndex];
            _strType =[_tagModle.id stringValue];
            
            [self tagClick:_strType Country:_strCountry Plot:_strPlot Year:_strYear];
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
            _tagModle =  [_arrayTwo objectAtIndex:btnIndex];
            _strCountry =[_tagModle.id stringValue];

            [self tagClick:_strType Country:_strCountry Plot:_strPlot Year:_strYear];
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
            _tagModle =  [_arrayThree objectAtIndex:btnIndex];
            _strPlot =[_tagModle.id stringValue];
            
            [self tagClick:_strType Country:_strCountry Plot:_strPlot Year:_strYear];
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
            _tagModle =  [_arrayFour objectAtIndex:btnIndex];
            _strYear =[_tagModle.id stringValue];
            
            [self tagClick:_strType Country:_strCountry Plot:_strPlot Year:_strYear];
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

-(void) tagClick:(NSString *)one Country:(NSString *)country Plot:(NSString *)plot Year:(NSString *)year
{
    NSMutableArray *arrayTags = [[NSMutableArray alloc ] initWithObjects:one,country,plot,year, nil];
    
    [[NSNotificationCenter defaultCenter ] postNotificationName:@"notification_tags" object:arrayTags];
}


-(NSMutableArray *) getTags:(NSNumber *)type{

    LKDBHelper *helper = [LKDBHelper getUsingLKDBHelper];
    NSString *orderBy = @"CAST(id as integer) asc";
    NSString *where = [NSString stringWithFormat:@"type=%@", type];
    NSMutableArray *tagArray = [helper search:[DramaTags class] where:where orderBy:orderBy offset:0 count:50];

   if(tagArray!=nil){

       return tagArray;
   } else
       return [[NSMutableArray alloc] init];
}

@end
