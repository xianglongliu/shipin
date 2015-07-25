//
//  ViewController.h
//  shipin
//
//  Created by Mapollo27 on 15/7/17.
//  Copyright (c) 2015年 dust.zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExUINavigationBar.h"
#import "FilmModel.h"



@interface ViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView         *_tableView;
    UIButton            *btnAll;
    UIButton            *btnGood;
}

//@property (nonatomic,strong)    ExUINavigationBar       *_navigationBar;
@property (nonatomic,strong)    NSMutableArray          *_arrayVideo;


@end
