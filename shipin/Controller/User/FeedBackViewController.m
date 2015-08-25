//
//  FeedBackViewController.m
//  shipin
//
//  Created by Mapollo27 on 15/8/15.
//  Copyright (c) 2015年 dust.zhang. All rights reserved.
//

#import "FeedBackViewController.h"

@interface FeedBackViewController ()

@end

@implementation FeedBackViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:RGB(238, 238, 238)];
    
    [self initViewCtrl];
}

-(void) initViewCtrl
{
    ExUINavigationBar *navigationBar = [[ExUINavigationBar alloc ] initWithFrameRect:CGRectMake(0, 0, SCREEN_WIDTH, TABBAR_HEIGHT) BGImage:@"navigationbar" StrTitle:@"意见反馈" ];
    [self.view addSubview:navigationBar];
    
    UIButton *btnBack = [[UIButton alloc ] initWithFrame:backButtonFram];
    [btnBack setImage:[UIImage imageNamed:@"btn_back.png"] forState:UIControlStateNormal];
    [btnBack addTarget:self action:@selector(onButtonBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnBack];
    
    UILabel *label = [[UILabel alloc ] initWithFrame:CGRectMake(20, TABBAR_HEIGHT, SCREEN_WIDTH, 16)];
    [label setText:@"意见反馈"];
    [label setTextColor :RGB(102, 102, 102)];
    [label setFont:[UIFont systemFontOfSize:12 ]];
    [self.view addSubview:label];
    
    
    _textView = [[UITextView alloc ] initWithFrame:CGRectMake(1, label.frame.size.height+label.frame.origin.y+5, SCREEN_WIDTH-2, 164)];
    _textView.layer.borderColor =RGB(221, 221, 221).CGColor;
    _textView.layer.borderWidth = 1;
    [self.view addSubview:_textView];

    UIButton *btnSave = [[UIButton alloc ] initWithFrame:CGRectMake(20, SCREEN_HEIGHT-60, SCREEN_WIDTH-40, 40)];
    [btnSave setTitle:@"提交" forState:UIControlStateNormal];
    btnSave.titleLabel.font = [UIFont systemFontOfSize:14];
    [btnSave  setBackgroundColor:yellowRgb];
    btnSave.layer.masksToBounds = YES;
    btnSave.layer.cornerRadius = 3;
    [btnSave addTarget:self action:@selector(onButtonSubmit) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnSave];

}


- (void)onButtonBack
{
    [self.navigationController popViewControllerAnimated:YES];
}


-(void) onButtonSubmit
{
    if ([_textView.text length] <= 0 )
    {
        [Tool showWarningTip:@"请输入反馈意见" view:self.view time:1];
        return;
    }
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_textView resignFirstResponder];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
