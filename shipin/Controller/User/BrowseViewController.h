//
//  BrowseViewController.h
//  shipin
//
//  Created by Mapollo27 on 15/8/18.
//  Copyright (c) 2015年 dust.zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AllTableViewCell.h"
#import "imageClickDelegate.h"

@interface BrowseViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,imageClickDelegate>
{
    NSMutableArray      *_arrayBrowse;
    UITableView         *_tableViewBrowse;

    DramaModel          *dramaLeft;
    DramaModel          *dramaRight;
}


@property (nonatomic ,strong) NSString *strViewName;
@end
