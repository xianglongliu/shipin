//
//  AllTableViewCell.h
//  shipin
//
//  Created by Mapollo27 on 15/7/26.
//  Copyright (c) 2015年 dust.zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DramaModel.h"
#import "DramaPostersModel.h"


@interface AllTableViewCell : UITableViewCell
{
    UIImageView *_imageViewLeft;
    UILabel     *_labelFilmNameLeft;
    UILabel     *_labelFilmContentLeft;
    UILabel     *_labelReadCountLeft;
    UILabel     *_labelGzCountLeft;
    
    UIImageView *_imageViewRight;
    UILabel     *_labelFilmNameRight;
    UILabel     *_labelFilmContentRight;
    UILabel     *_labelReadCountRight;
    UILabel     *_labelGzCountRight;
}

-(void) setControlLeftData:(DramaModel *)leftData rightData:(DramaModel *)rightData;

@end
