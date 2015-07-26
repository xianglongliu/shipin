//
//  HeadTableViewCell.m
//  shipin
//
//  Created by Mapollo27 on 15/7/26.
//  Copyright (c) 2015年 dust.zhang. All rights reserved.
//

#import "HeadTableViewCell.h"

@implementation HeadTableViewCell



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _imageViewHead = [[UIImageView alloc ] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 190)];
        [_imageViewHead setBackgroundColor:[UIColor grayColor]];
        [self addSubview:_imageViewHead];
        
        
    }
    return self;
}



@end
