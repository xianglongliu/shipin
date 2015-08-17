//
//  ViewController.h
//  shipin
//
//  Created by Mapollo27 on 15/7/17.
//  Copyright (c) 2015年 dust.zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExUINavigationBar.h"
#import "DramaModel.h"
#import "EGORefreshTableHeaderView.h"
#import "MJRefreshFooterView.h"

@interface ViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate,EGORefreshTableHeaderDelegate>
{
    UITableView         *_findTableView;
    UITableView         *_allTableView;
    UIButton            *btnAll;
    UIButton            *btnGood;
    BOOL                bIsColl;
    UIButton            *btnSpreadOut;
    int                             _currentPage;
    BOOL                            _reloading;
    MJRefreshFooterView             *_pullUpRefresh;
    EGORefreshTableHeaderView       *_refreshHeaderView;
    
    DramaModel *dramaLeft;
    DramaModel *dramaRight;

}

@property (nonatomic,strong)    ExUINavigationBar       *_navigationBar;
@property (nonatomic,strong)    NSMutableArray          *_arrayVideo;
@property (nonatomic,strong)    NSMutableArray          *_arrayNewVideo;

@property (nonatomic,strong)    NSMutableArray          *_arrayAllVideo;
@property (nonatomic,strong)    NSMutableArray          *_arrayNewAllVideo;


@end
