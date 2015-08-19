//
//  HeadTableViewCell.h
//  shipin
//
//  Created by Mapollo27 on 15/7/26.
//  Copyright (c) 2015年 dust.zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FXLabel.h"
#import "UserModel.h"



@interface SetViewHeadTableViewCell : UITableViewCell
{
    UIImageView *_imageViewBg ;
    UIImageView *_imageViewHead;
   
    UILabel     *_labelTransparentLayer;
}

@property(nonatomic,strong)     FXLabel     *_labelName;

-(void) setHeadCellData:(UserModel *)usermodle cellName:(NSString *)cellname;


@end
