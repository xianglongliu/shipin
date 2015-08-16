//
//  DetialHeadTableViewCell.h
//  shipin
//
//  Created by Mapollo27 on 15/8/16.
//  Copyright (c) 2015年 dust.zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DramaModel.h"
#import "DramaPostersModel.h"

@interface DetialHeadTableViewCell : UITableViewCell
{
    UIImageView     *_imageViewHead;
    UIImageView     *_imageViewUserHead;
    UILabel         *_labelUserName;
    UILabel         *_labelReadCount;
    UILabel         *_labelRecommend;
}

-(void) setCtrlText:(DramaModel*) dramaModle;

@end
