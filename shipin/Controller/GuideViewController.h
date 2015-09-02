//
//  GuideViewController.h
//  shipin
//
//  Created by Mapollo27 on 15/9/2.
//  Copyright (c) 2015年 dust.zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GuideViewController : UIViewController<UIScrollViewDelegate>
{
    BOOL            _isOut;
    NSArray         *_arrayImage;
    UIPageControl   *_pageCtrl;
    UIScrollView    *_scrollview;
    
}
@end
