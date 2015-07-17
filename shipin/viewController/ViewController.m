//
//  ViewController.m
//  shipin
//
//  Created by Mapollo27 on 15/7/17.
//  Copyright (c) 2015年 dust.zhang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)viewWillAppear:(BOOL)animated
{
    self.title = @"剧库";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initCtrl];
}

-(void) initCtrl
{
    UIButton *btnGood = [[UIButton alloc ] init];
    [btnGood setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview: btnGood];
    
    [btnGood mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(self.view.bounds.size.width/2, 40));
    }];
    
    UIButton *btnAll = [[UIButton alloc ] init];
    [btnAll setBackgroundColor:[UIColor redColor]];
    [self.view addSubview: btnAll];
    
    [btnAll mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.equalTo(btnGood.mas_right);
        make.size.mas_equalTo(btnGood);
    }];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
