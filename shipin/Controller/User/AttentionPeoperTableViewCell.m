//
//  AttentionPeoperTableViewCell.m
//  shipin
//
//  Created by Mapollo27 on 15/8/15.
//  Copyright (c) 2015年 dust.zhang. All rights reserved.
//

#import "AttentionPeoperTableViewCell.h"

@implementation AttentionPeoperTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        //头像
        _imageViewHead = [[UIImageView alloc ] initWithFrame:CGRectMake(20, 20, 50, 50)];
        _imageViewHead.layer.masksToBounds = YES;
        _imageViewHead.layer.cornerRadius =  50/2;
        [_imageViewHead setContentMode:UIViewContentModeScaleAspectFill];
        [self addSubview:_imageViewHead];
        
        //名字
        _labelName = [[UILabel alloc] initWithFrame:CGRectMake(_imageViewHead.frame.size.width+_imageViewHead.frame.origin.x+20, 20, SCREEN_WIDTH/1.6f, 18)];
        [_labelName setTextColor:[UIColor blackColor]];
        [_labelName setBackgroundColor:[UIColor clearColor]];
        [_labelName setFont:[UIFont boldSystemFontOfSize:13]];
        [_labelName setTextAlignment:NSTextAlignmentLeft];
        [self addSubview:_labelName];
        
        //公司名称
        _labelCompany = [[UILabel alloc] initWithFrame:CGRectMake(_labelName.frame.origin.x, 36, SCREEN_WIDTH/1.6f, 18)];
        [_labelCompany setTextColor:RGB(153, 153, 153)];
        [_labelCompany setBackgroundColor:[UIColor clearColor]];
        [_labelCompany setFont:[UIFont systemFontOfSize:10]];
        [_labelCompany setTextAlignment:NSTextAlignmentLeft];
        [self addSubview:_labelCompany];
        
        //职称
        _lableTitle = [[UILabel alloc] initWithFrame:CGRectMake(_labelName.frame.origin.x, 50, SCREEN_WIDTH/1.6f, 18)];
        [_lableTitle setTextColor:RGB(153, 153, 153)];
        [_lableTitle setBackgroundColor:[UIColor clearColor]];
        [_lableTitle setFont:[UIFont systemFontOfSize:10]];
        [_lableTitle setTextAlignment:NSTextAlignmentLeft];
        [self addSubview:_lableTitle];
        
    }
    return self;
}

-(void) setItemText:(UserModel *) userModleItem
{
    [_imageViewHead  sd_setImageWithURL:[NSURL URLWithString:userModleItem.avatar] placeholderImage:[UIImage imageNamed:DefaultImage]];
    [_labelName setText:userModleItem.name];
    [_labelCompany setText:userModleItem.corporation];
    [_lableTitle setText:userModleItem.position];
}

@end