//
//  SearchTableViewCell.h
//  shipin
//
//  Created by Mapollo27 on 15/8/23.
//  Copyright (c) 2015年 dust.zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DramaPostersModel.h"

@interface SearchTableViewCell : UITableViewCell
{
    UILabel         *_labelName;
    UIImageView     *_imageView;
    UILabel         *_labelContent;
}

-(void) setCtrlData:(DramaModel *)dramaItem;


@end
