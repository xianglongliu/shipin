//
//  VideoTableViewCell.h
//  shipin
//
//  Created by dust on 14-10-31.
//  Copyright (c) 2014年 dust. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FilmModel.h"

@interface FindTableViewCell : UITableViewCell
{
    UIImageView     *_imageView;
    UILabel         *_labelTitle;
    UILabel         *_labelContent;
}

-(void) setControlData:(FilmModel *)item;

@end
