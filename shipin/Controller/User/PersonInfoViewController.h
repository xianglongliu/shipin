//
//  PersonInfoViewController.h
//  shipin
//
//  Created by Mapollo27 on 15/8/13.
//  Copyright (c) 2015年 dust.zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FilmModel.h"

@interface PersonInfoViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray  *mutableArray;
    UIWebView       *phoneCallWebView;
    NSMutableArray  *_myDramaArray;
    UITableView     *_tableView ;
}

@property(nonatomic,strong)UserModel *userModel;

@property(nonatomic,assign) int _uId;


@end
