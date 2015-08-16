//
//  AddPublishViewController.h
//  shipin
//
//  Created by Mapollo27 on 15/8/15.
//  Copyright (c) 2015年 dust.zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyPublishModle.h"
#import "AddPublishTableViewCell.h"


@interface AddPublishViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray      *_arrayPublish;
    UITableView         *_tableView;
}


@end
