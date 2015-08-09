//
//  ExUINavigationBar.m
//  jifen
//
//  Created by jf.zhang on 13-9-18.
//  Copyright (c) 2013年 dlinkmac. All rights reserved.
//

#import "ExUINavigationBar.h"
#import "ImageUtil.h"
//#import "define.h"

@implementation ExUINavigationBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(id)initWithFrameRect:(CGRect)rect BGImage:(NSString *)image StrTitle:(NSString *)title
{
    if ((self=[super initWithFrame:rect]))
    {
        UILabel *labelTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 5, SCREEN_WIDTH, TABBAR_HEIGHT)];
        labelTitle.font = [UIFont boldSystemFontOfSize:20];
        labelTitle.textColor = [UIColor whiteColor];
        labelTitle.backgroundColor = [UIColor clearColor];
        [labelTitle setTextAlignment:NSTextAlignmentCenter];
        labelTitle.text = title;
        
        self.userInteractionEnabled=YES;
        navigationBar= [[UINavigationBar alloc] initWithFrame:rect];
        navigationBar.delegate = self;
        
        CGSize titleSize = navigationBar.bounds.size;
        [navigationBar addSubview:[[UIImageView alloc]  initWithImage:[[UIImage imageNamed:image] scaleImageToSize:[UIImage imageNamed:image] size:titleSize]]];
        [navigationBar addSubview:labelTitle];
        [self addSubview:navigationBar];
    }
    
    return self;
}

@end
