//
//  UIViewSearch.h
//  shipin
//
//  Created by Mapollo27 on 15/8/17.
//  Copyright (c) 2015年 dust.zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DramaTags.h"

@protocol pushSearchViewDelegate <NSObject>
@optional
-(void)pushToSearcheView;
@end


@interface UIViewSearch : UIView<UISearchBarDelegate>
{
    UIButton    *btnLine1[3];

    UIButton    *btnLine2[20];
    
    UIButton    *btnLine3[28];
    
    UIButton    *btnLine4[7];
    
    id<pushSearchViewDelegate> delegate;
    
    NSMutableArray     *_arrayOne;
    NSMutableArray     *_arrayTwo;
    NSMutableArray     *_arrayThree;
    NSMutableArray     *_arrayFour;
    
    
    NSString            *_strType;
    NSString            *_strCountry;
    NSString            *_strPlot;
    NSString            *_strYear;
    
    DramaTags           *_tagModle;
    
}

@property (nonatomic,retain) id<pushSearchViewDelegate> delegate;
@end
