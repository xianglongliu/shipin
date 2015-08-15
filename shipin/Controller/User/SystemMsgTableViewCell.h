//
//  SystemMsgTableViewCell.h
//  shipin
//
//  Created by Mapollo27 on 15/8/15.
//  Copyright (c) 2015年 dust.zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SystemMsgModle.h"

@interface SystemMsgTableViewCell : UITableViewCell
{
    UILabel *_labelTitle;
    UILabel *_labelContent;
    UILabel *_labelDate;

}

-(void) setItemText:(SystemMsgModle*) systemMsgModle;

@end
