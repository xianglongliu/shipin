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
            
            //用户名名称
            self._labelName = [[FXLabel alloc] initWithFrame:CGRectZero];
            [self._labelName setTextColor:[UIColor whiteColor]];
            [self._labelName setBackgroundColor:[UIColor clearColor]];
            [self._labelName setFont:[UIFont boldSystemFontOfSize:17]];
            [self._labelName setTextAlignment:NSTextAlignmentLeft];
            [self addSubview:self._labelName];
    }
    return self;
}

-(void) setHeadCellData:(UserModel *)usermodle cellName:(NSString *)cellname
{
    if ([cellname isEqualToString:@"setview" ])
    {
        _imageViewBg.frame = CGRectMake(0, 0, SCREEN_WIDTH, 190);
        _labelTransparentLayer.frame = CGRectMake(0, _imageViewBg.frame.size.height-34, SCREEN_WIDTH, 34);
        _imageViewHead.frame = CGRectMake(20, 60, 80, 80);
         _imageViewHead.layer.cornerRadius = _imageViewHead.frame.size.width/2;
        
        self._labelName.frame = CGRectMake(_imageViewHead.frame.origin.x+_imageViewHead.frame.size.width+10, _imageViewHead.frame.origin.y, SCREEN_WIDTH/2, _imageViewHead.frame.size.height);
        self._labelName.shadowColor = RGB(0, 0, 0);
        self._labelName.shadowOffset = CGSizeMake(0.5f, 1.0f);
        self._labelName.shadowBlur = 2.0f;
        
        //        赋值
        [_imageViewHead sd_setImageWithURL:[Tool stringMerge:usermodle.avatar] placeholderImage:DefaultImage];
        [self._labelName setText:[Tool isNull:usermodle.name] ];//
    }
    else
    {
        _imageViewBg.frame = CGRectMake(0, 0, SCREEN_WIDTH, 170);
        
        [_labelTransparentLayer setHidden:YES];
       
        _imageViewHead.frame = CGRectMake(SCREEN_WIDTH/3.2f, 85, SCREEN_WIDTH/2.7f, SCREEN_WIDTH/2.7f);
         _imageViewHead.layer.cornerRadius = _imageViewHead.frame.size.width/2;
        _imageViewHead.layer.borderWidth=5;
        _imageViewHead.layer.borderColor=[UIColor whiteColor].CGColor;
        [_imageViewHead setBackgroundColor:[UIColor grayColor]];
        
        self._labelName.frame = CGRectMake(0, _imageViewHead.frame.origin.y+_imageViewHead.frame.size.width+8, SCREEN_WIDTH/2, 20);
        [self._labelName setTextAlignment:NSTextAlignmentRight];
        [self._labelName setTextColor:[UIColor blackColor]];
        self._labelName.shadowColor = RGB(0, 0, 0);
        self._labelName.shadowOffset = CGSizeMake(0.1f, 0.0f);
        [self._labelName setBackgroundColor:[UIColor clearColor]];
        self._labelName.shadowBlur = 0.1f;
        
//        赋值
        [_imageViewHead sd_setImageWithURL:[Tool stringMerge:usermodle.avatar]  placeholderImage:DefaultImage];
        [self._labelName setText:[Tool isNull:usermodle.name]];
    }

    
}

@end
