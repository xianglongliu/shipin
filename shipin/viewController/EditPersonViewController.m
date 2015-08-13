//
//  EditPersonViewController.m
//  shipin
//
//  Created by Mapollo27 on 15/8/13.
//  Copyright (c) 2015年 dust.zhang. All rights reserved.
//

#import "EditPersonViewController.h"

@interface EditPersonViewController ()

@end

@implementation EditPersonViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor] ];
    [self initViewCtrl];
    
}

-(void) initViewCtrl
{
    self._navigationBar = [[ExUINavigationBar alloc ] initWithFrameRect:CGRectMake(0, 0, SCREEN_WIDTH, TABBAR_HEIGHT) BGImage:@"navigationbar" StrTitle:@"个人信息" ];
    [self.view addSubview:self._navigationBar];
    
    UIButton *btnLogin = [[UIButton alloc ] initWithFrame:CGRectMake(10, 25, 50, 25)];
    [btnLogin setImage:[UIImage imageNamed:@"ico-return.png"] forState:UIControlStateNormal];
    [btnLogin addTarget:self action:@selector(onButtonBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnLogin];
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
