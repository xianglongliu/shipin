//
//  AttentionPeoperViewController.h
//  shipin
//
//  Created by Mapollo27 on 15/8/15.
//  Copyright (c) 2015年 dust.zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserModel.h"

@interface AttentionPeoperViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray      *arrayAPeoper;
    UITableView         *_tableViewPersonInfo;
}
@end
