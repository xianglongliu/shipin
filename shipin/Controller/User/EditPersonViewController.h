//
//  EditPersonViewController.h
//  shipin
//
//  Created by Mapollo27 on 15/8/13.
//  Copyright (c) 2015年 dust.zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExUINavigationBar.h"
#import "FSMediaPicker.h"

@interface EditPersonViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate,FSMediaPickerDelegate>
{
    NSMutableArray          *mutableArray;
    UIAlertView*            _MediaAlert;
}
@property (nonatomic,strong)    ExUINavigationBar       *_navigationBar;
@property (nonatomic,strong)    UIImageView             *_imageViewHeadImage;


@end
