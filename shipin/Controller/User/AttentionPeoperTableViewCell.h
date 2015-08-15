//
//  AttentionPeoperTableViewCell.h
//  shipin
//
//  Created by Mapollo27 on 15/8/15.
//  Copyright (c) 2015年 dust.zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserModel.h"

@interface AttentionPeoperTableViewCell : UITableViewCell
{
    UIImageView *_imageViewHead;
    UILabel     *_labelName;
    UILabel     *_labelCompany;
    UILabel     *_lableTitle;
}

-(void) setItemText:(UserModel *) peoperItem;

@end
