//
//  UIViewSearch.h
//  shipin
//
//  Created by Mapollo27 on 15/8/17.
//  Copyright (c) 2015年 dust.zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

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
}

@property (nonatomic,retain) id<pushSearchViewDelegate> delegate;
@end
