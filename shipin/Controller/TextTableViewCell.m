//
//  TextTableViewCell.m
//  shipin
//
//  Created by Mapollo27 on 15/8/13.
//  Copyright (c) 2015年 dust.zhang. All rights reserved.
//

#import "TextTableViewCell.h"

@implementation TextTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.leftLable = [[UILabel alloc ] initWithFrame:CGRectMake(15, 0, 200, 40)];
    [self.leftLable setBackgroundColor:[UIColor clearColor]];
    [self.leftLable setFont:[UIFont systemFontOfSize:13]];
    [self.contentView addSubview:self.leftLable];
    
    self.rightLable = [[UILabel alloc ] initWithFrame:CGRectMake(100, 0, SCREEN_WIDTH-115, 40)];
    [self.rightLable setBackgroundColor:[UIColor clearColor]];
    [self.rightLable setFont:[UIFont systemFontOfSize:13]];
    [self.rightLable  setTextAlignment:NSTextAlignmentRight];
    [self.rightLable setTextColor:[UIColor grayColor] ];
    [self.contentView addSubview:self.rightLable];
    
    return self;
}
-(void) setLableText:(TextModel*)tModle;
{
    [self.leftLable  setText:tModle.strLeftName];
    [self.rightLable  setText:tModle.strRightName];
    
}

@end
