//
//  HeadTableViewCell.m
//  shipin
//
//  Created by Mapollo27 on 15/7/26.
//  Copyright (c) 2015年 dust.zhang. All rights reserved.
//

#import "SetViewHeadTableViewCell.h"

@implementation SetViewHeadTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
            //背景图
            _imageViewBg= [[UIImageView alloc ] initWithFrame:CGRectZero];
            [_imageViewBg setImage:[UIImage imageNamed:@"image_personhead.png"]];
            [self addSubview:_imageViewBg];
            //        透明图层
           _labelTransparentLayer = [[UILabel alloc ] initWithFrame:CGRectZero];
            [_labelTransparentLayer setBackgroundColor:RGBA(255, 255, 255, 0.1)];
            [self addSubview:_labelTransparentLayer];
            
            //        头像
            _imageViewHead = [[UIImageView alloc ] initWithFrame:CGRectZero];
            [_imageViewHead setImage:[UIImage imageNamed:@"image_head.png"]];
            _imageViewHead.layer.masksToBounds = YES;
            _imageViewHead.layer.borderWidth=4;
            _imageViewHead.layer.borderColor=RGB(251, 226, 199).CGColor;
            [_imageViewHead setContentMode:UIViewContentModeScaleAspectFill];
            [self addSubview:_imageViewHead];
            
            //影院名称
            _labelName = [[FXLabel alloc] initWithFrame:CGRectZero];
            [_labelName setTextColor:[UIColor whiteColor]];
            [_labelName setBackgroundColor:[UIColor clearColor]];
            [_labelName setFont:[UIFont boldSystemFontOfSize:17]];
            [_labelName setTextAlignment:NSTextAlignmentLeft];
            [self addSubview:_labelName];
    }
    return self;
}

-(void) setHeadCellData:(UserModel *)usermodle cellName:(NSString *)cellname
{
    if ([cellname isEqualToString:@"setview" ])
    {
        _imageViewBg.frame = CGRectMake(0, 0, SCREEN_WIDTH, 170);
       
        _labelTransparentLayer.frame = CGRectMake(0, _imageViewBg.frame.size.height-34, SCREEN_WIDTH, 34);
       
        _imageViewHead.frame = CGRectMake(20, 40, 80, 80);
         _imageViewHead.layer.cornerRadius = _imageViewHead.frame.size.width/2;
      
        _labelName.frame = CGRectMake(_imageViewHead.frame.origin.y+_imageViewHead.frame.size.width, _imageViewHead.frame.origin.y, SCREEN_WIDTH/2, _imageViewHead.frame.size.height);
        _labelName.shadowColor = RGB(0, 0, 0);
        _labelName.shadowOffset = CGSizeMake(0.5f, 1.0f);
        _labelName.shadowBlur = 2.0f;
        
//        赋值
        [_imageViewHead sd_setImageWithURL:[NSURL URLWithString:netWorkUrl] placeholderImage:DefaultImage];
        [_labelName setText:usermodle.name];
    }
    else
    {
        _imageViewBg.frame = CGRectMake(0, 0, SCREEN_WIDTH, 170);
        
        [_labelTransparentLayer setHidden:YES];
       
        _imageViewHead.frame = CGRectMake(SCREEN_WIDTH/3.2f, 85, SCREEN_WIDTH/2.7f, SCREEN_WIDTH/2.7f);
         _imageViewHead.layer.cornerRadius = _imageViewHead.frame.size.width/2;
        _imageViewHead.layer.borderWidth=5;
        _imageViewHead.layer.borderColor=[UIColor whiteColor].CGColor;
        
        _labelName.frame = CGRectMake(0, _imageViewHead.frame.origin.y+_imageViewHead.frame.size.width+10, SCREEN_WIDTH, 20);
        [_labelName setTextAlignment:NSTextAlignmentCenter];
        [_labelName setTextColor:[UIColor blackColor]];
        _labelName.shadowColor = RGB(0, 0, 0);
        _labelName.shadowOffset = CGSizeMake(0.1f, 0.0f);
        _labelName.shadowBlur = 0.1f;
        
//        赋值
        [_imageViewHead sd_setImageWithURL:[NSURL URLWithString:netWorkUrl] placeholderImage:DefaultImage];
        [_labelName setText:usermodle.name];
    }

    
}

@end
