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
#import "FilmModel.h"
#import "UserModel.h"

@interface EditPersonViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate,FSMediaPickerDelegate>
{
    NSMutableArray          *mutableArray;
    UIAlertView             *_MediaAlert;
    UITableView             *tableViewPersonInfo;
    UIImageView             *imageviewHead;
    
    BOOL                    isSelectImage;
}
@property (nonatomic,strong)    ExUINavigationBar       *_navigationBar;
//@property (nonatomic,strong)    UIImageView             *_imageViewHeadImage;
@property(nonatomic,strong)     TextModel               *userInfoModel;
@property(nonatomic,strong)     UserModel               *_userModel;
@property(nonatomic,assign)     int                     _uId;

@end
