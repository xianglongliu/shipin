//
//  JKPhotoBrowser.h
//  JKPhotoBrowser
//
//  Created by Jecky on 14/12/29.
//  Copyright (c) 2014年 Jecky. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JKPhotoBrowser;


@interface JKPhotoBrowser : UIView

@property (nonatomic, strong) NSMutableArray        *assetsArray;
@property (nonatomic, assign) NSInteger             currentPage;

- (void)show:(BOOL)animated;
- (void)hide;

@end
