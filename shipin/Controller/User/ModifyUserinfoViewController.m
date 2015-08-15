//
//  ModifyUserinfoViewController.m
//  shipin
//
//  Created by Mapollo27 on 15/8/15.
//  Copyright (c) 2015年 dust.zhang. All rights reserved.
//

#import "ModifyUserinfoViewController.h"

@interface ModifyUserinfoViewController ()

@end

@implementation ModifyUserinfoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:RGB(238, 238, 238)];
    
    ExUINavigationBar *navigationBar = [[ExUINavigationBar alloc ] initWithFrameRect:CGRectMake(0, 0, SCREEN_WIDTH, TABBAR_HEIGHT) BGImage:@"navigationbar" StrTitle:[NSString stringWithFormat:@"修改%@",self._strSelItem]];
    [self.view addSubview:navigationBar];
    
    UIButton *btnBack = [[UIButton alloc ] initWithFrame:backButtonFram];
    [btnBack setImage:[UIImage imageNamed:@"btn_back.png"] forState:UIControlStateNormal];
    [btnBack addTarget:self action:@selector(onButtonBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnBack];

    
    self._textContent = [[UITextField alloc ] initWithFrame:CGRectMake(20, TABBAR_HEIGHT+20, SCREEN_WIDTH-40, 30)];
    self._textContent.layer.masksToBounds = YES;
    self._textContent.layer.cornerRadius = 3;
    [self._textContent setBackgroundColor:[UIColor whiteColor] ];
    [ self._textContent setFont:[UIFont systemFontOfSize:14]];
    [self.view addSubview:self._textContent];
    
    UIButton *btnSave = [[UIButton alloc ] initWithFrame:CGRectMake(20, SCREEN_HEIGHT-60, SCREEN_WIDTH-40, 40)];
    [btnSave setTitle:@"修改" forState:UIControlStateNormal];
    btnSave.titleLabel.font = [UIFont systemFontOfSize:14];
    [btnSave  setBackgroundColor:yellowRgb];
    btnSave.layer.masksToBounds = YES;
    btnSave.layer.cornerRadius = 3;
    [btnSave addTarget:self action:@selector(onButtonModifyUserInfo) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnSave];
}

-(void) viewDidAppear:(BOOL)animated
{
    self._textContent.text = self._strName;
}


//保存用户修改的用户信息
-(void) onButtonModifyUserInfo
{
    [self onButtonBack];
}


-(void) onButtonBack
{
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
