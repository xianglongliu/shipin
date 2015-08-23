//
//  SearchViewController.h
//  shipin
//
//  Created by Mapollo27 on 15/8/23.
//  Copyright (c) 2015年 dust.zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchViewController : UIViewController<UISearchBarDelegate,UITableViewDataSource,UITableViewDelegate>
{
    UITableView     *_tableViewSearch;
    NSMutableArray  *_arraySearch;
    UISearchBar     *_searchBar;
}
@end
