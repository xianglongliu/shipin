//
//  AboutViewController.m
//  shipin
//
//  Created by Mapollo27 on 15/8/15.
//  Copyright (c) 2015年 dust.zhang. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[UIApplication  sharedApplication] setStatusBarHidden:NO];
    [self initViewCtrl];
}

-(void) initViewCtrl
{
    ExUINavigationBar *navigationBar = [[ExUINavigationBar alloc ] initWithFrameRect:CGRectMake(0, 0, SCREEN_WIDTH, TABBAR_HEIGHT) BGImage:@"navigationbar" StrTitle:@"关于我们" ];
    [self.view addSubview:navigationBar];
    
    UIButton *btnBack = [[UIButton alloc ] initWithFrame:backButtonFram];
    [btnBack setImage:[UIImage imageNamed:@"btn_back.png"] forState:UIControlStateNormal];
    [btnBack addTarget:self action:@selector(onButtonBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnBack];
    
    UIImageView* aboutIcon = [[UIImageView alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-81)/2, 120, 81, 81)];
    [aboutIcon setImage:[UIImage imageNamed:@"iTunesArtwork.png"]];
    [self.view addSubview:aboutIcon];
    
    UILabel* titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 206, SCREEN_WIDTH, 17)];
    [titleLabel setText:@"剧库"];
    [titleLabel setTextAlignment:NSTextAlignmentCenter];
    [titleLabel setFont:[UIFont systemFontOfSize:17]];
    [titleLabel setTextColor:RGB(255, 255, 255)];
    [self.view addSubview:titleLabel];
    
    UILabel* versionLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 239, SCREEN_WIDTH, 14)];
    [versionLabel setText:[NSString stringWithFormat:@"当前版本：%@",[[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString*)kCFBundleVersionKey]]];
    [versionLabel setTextAlignment:NSTextAlignmentCenter];
    [versionLabel setFont:[UIFont systemFontOfSize:14]];
    [versionLabel setTextColor:[UIColor blackColor]];
    [self.view addSubview:versionLabel];
    

    
}

- (void)onButtonBack
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
