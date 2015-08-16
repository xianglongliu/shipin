//
//  WifiViewController.m
//  shipin
//
//  Created by Mapollo27 on 15/8/16.
//  Copyright (c) 2015年 dust.zhang. All rights reserved.
//

#import "WifiViewController.h"

@interface WifiViewController ()

@end

@implementation WifiViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:RGB(238, 238, 238)];
    
    [self initViewCtrl];
}

-(void) initViewCtrl
{
    ExUINavigationBar *navigationBar = [[ExUINavigationBar alloc ] initWithFrameRect:CGRectMake(0, 0, SCREEN_WIDTH, TABBAR_HEIGHT) BGImage:@"navigationbar" StrTitle:@"添加剧目" ];
    [self.view addSubview:navigationBar];
    
    UIButton *btnBack = [[UIButton alloc ] initWithFrame:backButtonFram];
    [btnBack setImage:[UIImage imageNamed:@"btn_back.png"] forState:UIControlStateNormal];
    [btnBack addTarget:self action:@selector(onButtonBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnBack];
    
    UITextField *textFieldFilmName = [[UITextField alloc ] initWithFrame:CGRectMake(20,TABBAR_HEIGHT+ 20, SCREEN_WIDTH-40, 30)];
    textFieldFilmName.layer.masksToBounds = YES;
    textFieldFilmName.layer.cornerRadius = 3;
    [textFieldFilmName setBackgroundColor:[UIColor whiteColor] ];
    [textFieldFilmName setPlaceholder:@"  请添加需要上传的剧目名称"];
    textFieldFilmName.layer.borderWidth = 1;
    textFieldFilmName.layer.borderColor = RGB(221, 221, 221).CGColor;
    [textFieldFilmName setFont:[UIFont systemFontOfSize:10]];
    textFieldFilmName.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.view addSubview:textFieldFilmName];
    
    
    UIButton *btnSave = [[UIButton alloc ] initWithFrame:CGRectMake(20, SCREEN_HEIGHT-60, SCREEN_WIDTH-40, 40)];
    [btnSave setTitle:@"确认添加" forState:UIControlStateNormal];
    btnSave.titleLabel.font = [UIFont systemFontOfSize:14];
    [btnSave  setBackgroundColor:yellowRgb];
    btnSave.layer.masksToBounds = YES;
    btnSave.layer.cornerRadius = 3;
    [btnSave addTarget:self action:@selector(onButtonEnsureAdd) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnSave];
}

//保存用户修改的用户信息
-(void) onButtonEnsureAdd
{
    
}

-(void) onButtonBack
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
