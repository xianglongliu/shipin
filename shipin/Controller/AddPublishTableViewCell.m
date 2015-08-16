//
//  AddPublishTableViewCell.m
//  shipin
//
//  Created by Mapollo27 on 15/8/16.
//  Copyright (c) 2015年 dust.zhang. All rights reserved.
//

#import "AddPublishTableViewCell.h"

@implementation AddPublishTableViewCell



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self setBackgroundColor:RGB(238, 238, 238)];
        
        UILabel *labelWhiteBg = [[UILabel alloc ] initWithFrame:CGRectMake(20, 40, SCREEN_WIDTH-40, 145)];
        [labelWhiteBg setBackgroundColor:[UIColor whiteColor]];
        [self addSubview:labelWhiteBg];

        _imageViewType = [[UIImageView alloc ] initWithFrame:CGRectMake(40, 10, 148/2.2f, 148/2.2f)];
        [self addSubview:_imageViewType];
        
        _labelTypeName = [[UILabel alloc] initWithFrame:CGRectMake(40, _imageViewType.frame.size.height+_imageViewType.frame.origin.y+10, SCREEN_WIDTH, 18)];
        [_labelTypeName setTextColor:RGB(34, 34, 34)];
        [_labelTypeName setBackgroundColor:[UIColor clearColor]];
        [_labelTypeName setFont:[UIFont boldSystemFontOfSize:15]];
        [_labelTypeName setTextAlignment:NSTextAlignmentLeft];
        [self addSubview:_labelTypeName];

        //内容
        _label1 = [[UILabel alloc] initWithFrame:CGRectMake(40, _labelTypeName.frame.size.height+_labelTypeName.frame.origin.y+10, SCREEN_WIDTH, 60)];
        [_label1 setTextColor:RGB(153, 153, 153)];
        [_label1 setBackgroundColor:[UIColor clearColor]];
        [_label1 setFont:[UIFont boldSystemFontOfSize:11]];
//        [_label1 setTextAlignment:NSTextAlignmentLeft];
        _label1.numberOfLines = 0;
        [_label1 setLineBreakMode:NSLineBreakByCharWrapping];
        [self addSubview:_label1];
             
    }
    return self;
}


-(void) setItemText:(AddPublishTypeModle*)item
{
    [_imageViewType setImage:[UIImage imageNamed:item.pImage]];
    [_labelTypeName setText:item.pTypename];
    
    [_label1 setText:[NSString stringWithFormat:@"%@\n%@\n%@\n%@",item.p1,item.p2,item.p3,item.p4]];
    [Tool setLabelSpacing:_label1 spacing:3 alignment:NSTextAlignmentLeft];
}


@end
