//
//  SystemMsgViewController.h
//  shipin
//
//  Created by Mapollo27 on 15/8/15.
//  Copyright (c) 2015年 dust.zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessageModel.h"


@interface SystemMsgViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray      *_arraySystemMsg;
    UITableView         *_tableViewSystemMsg;
}


@end
