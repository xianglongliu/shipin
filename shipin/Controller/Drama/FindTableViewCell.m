//
//  VideoTableViewCell.m
//  shipin
//
//  Created by dust on 14-10-31.
//  Copyright (c) 2014年 dust. All rights reserved.
//

#import "FindTableViewCell.h"

@implementation FindTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _imageView = [[UIImageView alloc ] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 135)];
        [_imageView setBackgroundColor:[UIColor grayColor]];
        [self addSubview:_imageView];
        
        UILabel *labelBg = [[UILabel alloc ] initWithFrame:CGRectMake(0, _imageView.frame.size.height-45, SCREEN_WIDTH, 45)];
        [labelBg setBackgroundColor:RGBA(0, 0, 0, 0.5)];
        [_imageView addSubview:labelBg];
        
        _labelTitle = [[UILabel alloc ] initWithFrame:CGRectMake(0,  _imageView.frame.size.height-45,SCREEN_WIDTH, 22.5f)];
        [_labelTitle setBackgroundColor:[UIColor clearColor] ];
        [_labelTitle setText:@"绝迹重生"];
        [_labelTitle setFont:[UIFont systemFontOfSize:12]];
        [_labelTitle setTextColor:[UIColor whiteColor]];
        [_imageView addSubview:_labelTitle];

        _labelContent = [[UILabel alloc ] initWithFrame:CGRectMake(0, _imageView.frame.size.height-22.5f, SCREEN_WIDTH, 22.5f)];
        [_labelContent setBackgroundColor:[UIColor clearColor] ];
        [_labelContent setText:@"verferf"];
        [_labelContent setFont:[UIFont systemFontOfSize:12]];
        [_labelContent setTextColor:RGB(250, 250, 250) ];
        [_imageView addSubview:_labelContent];
        
      
    }
    return self;
}


-(void) setControlData:(FilmModel *)item
{
//    [_imageView sd_setImageWithURL:item.fileUrl placeholderImage:[UIImage imageNamed:DefaultImage]];
//    [_labelTitle setText:item.filmTitle];
//    [_labelContent setText:item.filmContent];
}

@end
