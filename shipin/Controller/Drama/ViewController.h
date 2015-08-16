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
#import "DramaServices.h"
#import "EGORefreshTableHeaderView.h"
#import "MJRefreshFooterView.h"

@interface ViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate,EGORefreshTableHeaderDelegate>
{
    UITableView         *_findTableView;
    UITableView         *_allTableView;
    UIButton            *btnAll;
    UIButton            *btnGood;
    UIView              *_viewColl;
    BOOL                bIsColl;
    UIButton            *btnCheck[50];
    NSArray             *arrCheck;
    UISearchBar         *_searchBar;
    UIButton            *btnNewOnLine,*btnNewHot,*btnNewCollect;
    UIButton            *btnColl;
    
    int                             _currentPage;
    EGORefreshTableHeaderView       *_refreshHeaderView;
    BOOL                            _reloading;
//    int                             _pageCount;
    MJRefreshFooterView             *_pullUpRefresh;
}

@property (nonatomic,strong)    ExUINavigationBar       *_navigationBar;
@property (nonatomic,strong)    NSMutableArray          *_arrayVideo;
@property (nonatomic,strong)    NSMutableArray          *_arrayNewVideo;

@end
