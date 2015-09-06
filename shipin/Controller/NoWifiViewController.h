//
//  NoWifiViewController.h
//  shipin
//
//  Created by Mapollo27 on 15/8/16.
//  Copyright (c) 2015年 dust.zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DramaModel.h"
#import "UIButtonTableViewCell.h"

@interface NoWifiViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
{
    UITableView         *_tableView;
    NSArray             *arrayHeight;
    
    DramaModel          *_dramaModel;
    
    UITextField         *_textFieldDramaName;
    UITextField          *_textViewBrief;
    
    UITextField         *_textFieldDirector;
    UITextField         *_textFieldBj;
    UITextField         *_textFieldStaring;
    UITextField         *_textFieldDistrict;
    UITextField         *_textFieldLanguage;
    UITextField         *_textFieldPremiere;
    UITextField         *_textFieldRecommend;
    
    UITextField         *_textFieldJs;
    UITextField         *_textFieldCpdw;
    UITextField         *_textFieldZpdw;
    UITextField         *_textFieldKjsj;
    UITextField         *_textFieldSqsj;
    
    

}


@end
