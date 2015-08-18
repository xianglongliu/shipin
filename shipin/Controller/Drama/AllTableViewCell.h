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
#import "imageClickDelegate.h"


@interface AllTableViewCell : UITableViewCell
{
    UILabel     *_labelbgLeft;
    UIImageView *_imageViewLeft;
    UILabel     *_labelFilmNameLeft;
    UILabel     *_labelFilmContentLeft;
    UILabel     *_labelReadCountLeft;
    UILabel     *_labelGzCountLeft;
    
    UILabel     *_labelbgRight;
    UIImageView *_imageViewRight;
    UILabel     *_labelFilmNameRight;
    UILabel     *_labelFilmContentRight;
    UILabel     *_labelReadCountRight;
    UILabel     *_labelGzCountRight;
    
    UITapGestureRecognizer *gestureLeft;
    UITapGestureRecognizer *gestureRight;

    DramaModel *_leftData;
    DramaModel *_rightData;

    id<imageClickDelegate>delegate;
}

@property (nonatomic, strong) id <imageClickDelegate> delegate;

-(void) setControlLeftData:(DramaModel *)leftData rightData:(DramaModel *)rightData;

@end
