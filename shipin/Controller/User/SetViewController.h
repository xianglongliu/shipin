//
//  SetViewController.h
//  shipin
//
//  Created by Mapollo27 on 15/7/26.
//  Copyright (c) 2015年 dust.zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShareView.h"

@interface SetViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate,ShareDelegate>
{
    UITableView     *_tableView;
    ShareView       *_shareView;
}


@property(nonatomic,strong)UserModel *userModel;

@end
