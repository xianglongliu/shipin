//
//  PublishCellTableViewCell.m
//  shipin
//
//  Created by Mapollo27 on 15/8/15.
//  Copyright (c) 2015年 dust.zhang. All rights reserved.
//

#import "PublishCellTableViewCell.h"

@implementation PublishCellTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        //左边数据
        UIImageView  *imageViewBg = [[UIImageView alloc ] initWithFrame:CGRectMake(10, 10, (SCREEN_WIDTH-30)/2, (SCREEN_HEIGHT-TABBAR_HEIGHT)/3-10 )];
        [imageViewBg setBackgroundColor:RGB(252, 252, 252)];
        [self addSubview:imageViewBg];
        
        _imageViewfilmLeft = [[UIImageView alloc ] initWithFrame:CGRectMake(0, 0, imageViewBg.frame.size.width, imageViewBg.frame.size.width-45 )];
        [_imageViewfilmLeft sd_setImageWithURL:[NSURL URLWithString:netWorkUrl] ];
        [imageViewBg addSubview:_imageViewfilmLeft];
        
//        //标题
//        _labelTitleLeft = [[UILabel alloc] initWithFrame:CGRectMake(20, 8, SCREEN_WIDTH, 18)];
//        [_labelTitleLeft setTextColor:RGB(34, 34, 34)];
//        [_labelTitleLeft setBackgroundColor:[UIColor clearColor]];
//        [_labelTitleLeft setFont:[UIFont boldSystemFontOfSize:13]];
//        [_labelTitleLeft setTextAlignment:NSTextAlignmentLeft];
//        [self addSubview:_labelTitleLeft];
        
     
        
    }
    return self;
}

-(void) setItemText:(MyPublishModle*) systemMsgModle
{
    
}


@end
