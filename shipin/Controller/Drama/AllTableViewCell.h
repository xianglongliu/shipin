//
//  AllTableViewCell.h
//  shipin
//
//  Created by Mapollo27 on 15/7/26.
//  Copyright (c) 2015年 dust.zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DramaModel.h"

@interface AllTableViewCell : UITableViewCell
{
    UIImageView *_imageViewLeft;
    UIImageView *_imageViewRight;
}

-(void) setControlData:(DramaModel *)item;

@end
