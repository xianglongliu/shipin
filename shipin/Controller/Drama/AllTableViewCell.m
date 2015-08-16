//
//  AllTableViewCell.m
//  shipin
//
//  Created by Mapollo27 on 15/7/26.
//  Copyright (c) 2015年 dust.zhang. All rights reserved.
//

#import "AllTableViewCell.h"

@implementation AllTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _imageViewLeft = [[UIImageView alloc ] initWithFrame:CGRectMake(10, 10, (SCREEN_WIDTH-30)/2, (SCREEN_WIDTH-30)/2-35)];
        [_imageViewLeft setBackgroundColor:[UIColor grayColor]];
        [self addSubview:_imageViewLeft];
        
        _imageViewRight = [[UIImageView alloc ] initWithFrame:CGRectMake(_imageViewLeft.frame.origin.x+_imageViewLeft.frame.size.width+10, 10, _imageViewLeft.frame.size.width, _imageViewLeft.frame.size.height)];
        [_imageViewRight setBackgroundColor:[UIColor grayColor]];
        [self addSubview:_imageViewRight];
        
        
    }
    return self;
}


-(void) setControlData:(DramaModel *)item
{
    //    [_imageView sd_setImageWithURL:item.fileUrl placeholderImage:[UIImage imageNamed:DefaultImage]];
    //    [_labelTitle setText:item.filmTitle];
    //    [_labelContent setText:item.filmContent];
}


@end
