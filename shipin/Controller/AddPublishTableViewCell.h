//
//  AddPublishTableViewCell.h
//  shipin
//
//  Created by Mapollo27 on 15/8/16.
//  Copyright (c) 2015年 dust.zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyPublishModle.h"


@interface AddPublishTableViewCell : UITableViewCell
{
    UIImageView     *_imageViewType;
    UILabel         *_labelTypeName;
    UILabel         *_label1;
  
}

-(void) setItemText:(AddPublishTypeModle*)item;


@end
