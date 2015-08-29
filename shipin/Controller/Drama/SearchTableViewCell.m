//
//  SearchTableViewCell.m
//  shipin
//
//  Created by Mapollo27 on 15/8/23.
//  Copyright (c) 2015年 dust.zhang. All rights reserved.
//

#import "SearchTableViewCell.h"

@implementation SearchTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        UILabel *labelBg = [[UILabel alloc ] initWithFrame:CGRectMake(10, 10, SCREEN_WIDTH-20, 112)];
        [labelBg setBackgroundColor:RGB(221, 221, 221)];
        [self addSubview:labelBg];
        
        _labelName = [[UILabel alloc ] initWithFrame:CGRectMake(11, 11, SCREEN_WIDTH-22, 34)];
        [_labelName setBackgroundColor:RGB(246, 246, 246)];
        [_labelName setTextColor:RGB(34, 34, 34)];
        [_labelName setText:@"  rjgoehgi"];
        [_labelName setFont:[UIFont systemFontOfSize:13] ];
        [self addSubview:_labelName];
        
        UILabel *labelImageBg = [[UILabel alloc ] initWithFrame:CGRectMake(11, _labelName.frame.size.height+_labelName.frame.origin.y+1, 98, labelBg.frame.size.height-37)];
        [labelImageBg setBackgroundColor:[UIColor whiteColor] ];
        [self addSubview:labelImageBg];
        
        _imageView = [[UIImageView alloc ] initWithFrame:CGRectMake(21,labelImageBg.frame.origin.y+10, labelImageBg.frame.size.width-20, labelImageBg.frame.size.height-20)];
        [_imageView setBackgroundColor:[UIColor grayColor] ];
        [self addSubview:_imageView];
        
        
        UILabel *labelTextBg = [[UILabel alloc ] initWithFrame:CGRectMake(labelImageBg.frame.size.width+labelImageBg.frame.origin.x+1, labelImageBg.frame.origin.y, labelBg.frame.size.width-labelImageBg.frame.size.width-3, labelImageBg.frame.size.height)];
        [labelTextBg setBackgroundColor:[UIColor whiteColor] ];
        [self addSubview:labelTextBg];
        
        
        _labelContent= [[UILabel alloc ] initWithFrame:CGRectMake(labelImageBg.frame.size.width+labelImageBg.frame.origin.x+10, labelImageBg.frame.origin.y+10, labelBg.frame.size.width-labelImageBg.frame.size.width-20, labelImageBg.frame.size.height-20)];
        [_labelContent setBackgroundColor:[UIColor clearColor] ];
        _labelContent.numberOfLines = 0;
        [_labelContent setLineBreakMode:NSLineBreakByCharWrapping];
        [_labelContent setFont:[UIFont systemFontOfSize:10]];
        [self addSubview:_labelContent];
    }
    return self;
}

-(void) setCtrlData:(DramaModel *)dramaItem
{
    if ([dramaItem.posters count] > 0 )
    {
        DramaPostersModel *imageUrl = dramaItem.posters[0];
        [_imageView sd_setImageWithURL:[Tool stringMerge:imageUrl.poster] placeholderImage:DefaultImage];
    }
    
    [_labelName setText:[NSString stringWithFormat:@"   %@",dramaItem.name] ];
    [_labelContent setText:dramaItem.brief];
}

@end
