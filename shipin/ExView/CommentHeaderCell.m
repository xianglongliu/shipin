//
//  CommentHeaderCellTableViewCell.m
//  movikr
//
//  Created by Mapollo25 on 15/5/20.
//  Copyright (c) 2015年 zeyuan. All rights reserved.
//

#import "CommentHeaderCell.h"

@implementation CommentHeaderCell


-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if(self)
    {
        self.imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, (SCREEN_WIDTH-60)/3, 145)];
        self.imageView.layer.masksToBounds = YES;
        [self.imageView setContentMode:UIViewContentModeScaleAspectFill];
        self.contentView.backgroundColor=[UIColor clearColor];
        [self.contentView addSubview:self.imageView];
        
        
        self.labelName=[[UILabel alloc]initWithFrame:CGRectMake(self.imageView.frame.origin.x, self.imageView.frame.origin.y+self.imageView.frame.size.height+5, self.imageView.frame.size.width, 18)];
        [self.labelName setBackgroundColor:[UIColor clearColor]];
        [self.labelName setFont:[UIFont boldSystemFontOfSize:10]];
        [self.labelName setTextColor:RGB(34, 34, 34)];
        [self.labelName setTextAlignment:NSTextAlignmentCenter];
        [self.contentView addSubview:self.labelName];

    }
    
    return self;
}
@end
