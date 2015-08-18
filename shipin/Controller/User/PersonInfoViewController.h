//
//  PersonInfoViewController.h
//  shipin
//
//  Created by Mapollo27 on 15/8/13.
//  Copyright (c) 2015年 dust.zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonInfoViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray * mutableArray;
}

@property(nonatomic,strong)UserModel *userModel;

@end
