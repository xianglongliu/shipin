//
//  SystemMsgTableViewCell.m
//  shipin
//
//  Created by Mapollo27 on 15/8/15.
//  Copyright (c) 2015年 dust.zhang. All rights reserved.
//

#import "SystemMsgTableViewCell.h"

@implementation SystemMsgTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        //标题
        _labelTitle = [[UILabel alloc] initWithFrame:CGRectMake(20, 8, SCREEN_WIDTH, 18)];
        [_labelTitle setTextColor:RGB(34, 34, 34)];
        [_labelTitle setBackgroundColor:[UIColor clearColor]];
        [_labelTitle setFont:[UIFont boldSystemFontOfSize:13]];
        [_labelTitle setTextAlignment:NSTextAlignmentLeft];
        [self addSubview:_labelTitle];
        
        //内容
        _labelContent = [[UILabel alloc] initWithFrame:CGRectMake(20, 26, SCREEN_WIDTH, 18)];
        [_labelContent setTextColor:RGB(153, 153, 153)];
        [_labelContent setBackgroundColor:[UIColor clearColor]];
        [_labelContent setFont:[UIFont boldSystemFontOfSize:11]];
        [_labelContent setTextAlignment:NSTextAlignmentLeft];
        [self addSubview:_labelContent];
        
        //日期
        _labelDate = [[UILabel alloc] initWithFrame:CGRectMake(20, 42, SCREEN_WIDTH, 18)];
        [_labelDate setTextColor:RGB(204, 204, 204)];
        [_labelDate setBackgroundColor:[UIColor clearColor]];
        [_labelDate setFont:[UIFont boldSystemFontOfSize:9]];
        [_labelDate setTextAlignment:NSTextAlignmentLeft];
        [self addSubview:_labelDate];
        
    }
    return self;
}

-(void) setItemText:(MessageModel*) systemMsgModle
{
    [_labelTitle setText:systemMsgModle.title];
    [_labelContent setText:systemMsgModle.msg];
    [_labelDate setText:systemMsgModle.createTime];
}

@end
