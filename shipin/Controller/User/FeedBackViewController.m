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
    
    UILabel *label = [[UILabel alloc ] initWithFrame:CGRectMake(0, TABBAR_HEIGHT, SCREEN_WIDTH, 150)];
    [label setBackgroundColor:[UIColor whiteColor] ];
    [self.view addSubview:label];
    
    label = [[UILabel alloc ] initWithFrame:CGRectMake(20, TABBAR_HEIGHT+5, SCREEN_WIDTH, 16)];
    [label setText:@"联系人信息"];
    [label setTextColor :RGB(102, 102, 102)];
    [label setFont:[UIFont systemFontOfSize:12 ]];
    [self.view addSubview:label];
    
    label = [[UILabel alloc ] initWithFrame:CGRectMake(0, label.frame.size.height+label.frame.origin.y+5, SCREEN_WIDTH, 1)];
    [label setBackgroundColor:RGB(221, 221, 221)];
    [self.view addSubview:label];
    
    UILabel *labelText = [[UILabel alloc ] initWithFrame:CGRectMake(20,label.frame.origin.y, SCREEN_WIDTH, 40)];
    [labelText setText:@"姓名"];
    [labelText setTextColor :[UIColor blackColor] ];
    [labelText setFont:[UIFont systemFontOfSize:12 ]];
    [labelText setBackgroundColor:[UIColor clearColor] ];
    [self.view addSubview:labelText];
    
    _textFieldName = [[UITextField alloc ] initWithFrame:CGRectMake(SCREEN_WIDTH/2.20f,labelText.frame.origin.y, SCREEN_WIDTH/2, 40)];
    [_textFieldName setTextColor :[UIColor blackColor] ];
    [_textFieldName setFont:[UIFont systemFontOfSize:12 ]];
    [_textFieldName setBackgroundColor:[UIColor clearColor] ];
    [_textFieldName setPlaceholder:@"请输入姓名"];
    [_textFieldName setTextAlignment:NSTextAlignmentRight];
    [self.view addSubview:_textFieldName];
    
    
    label = [[UILabel alloc ] initWithFrame:CGRectMake(0, label.frame.size.height+label.frame.origin.y+40, SCREEN_WIDTH, 1)];
    [label setBackgroundColor:RGB(221, 221, 221)];
    [self.view addSubview:label];
    
    labelText = [[UILabel alloc ] initWithFrame:CGRectMake(20,label.frame.origin.y, SCREEN_WIDTH, 40)];
    [labelText setText:@"手机号"];
    [labelText setTextColor :[UIColor blackColor] ];
    [labelText setFont:[UIFont systemFontOfSize:12 ]];
    [labelText setBackgroundColor:[UIColor clearColor] ];
    [self.view addSubview:labelText];
    
    _textFieldTel = [[UITextField alloc ] initWithFrame:CGRectMake(SCREEN_WIDTH/2.20f,labelText.frame.origin.y, SCREEN_WIDTH/2, 40)];
    [_textFieldTel setTextColor :[UIColor blackColor] ];
    [_textFieldTel setFont:[UIFont systemFontOfSize:12 ]];
    [_textFieldTel setBackgroundColor:[UIColor clearColor] ];
    [_textFieldTel setPlaceholder:@"请输入手机号"];
    [_textFieldTel setTextAlignment:NSTextAlignmentRight];
    [self.view addSubview:_textFieldTel];
    
    label = [[UILabel alloc ] initWithFrame:CGRectMake(0, label.frame.size.height+label.frame.origin.y+40, SCREEN_WIDTH, 1)];
    [label setBackgroundColor:RGB(221, 221, 221)];
    [self.view addSubview:label];
    
    labelText = [[UILabel alloc ] initWithFrame:CGRectMake(20,label.frame.origin.y, SCREEN_WIDTH, 40)];
    [labelText setText:@"电子邮箱"];
    [labelText setTextColor :[UIColor blackColor] ];
    [labelText setFont:[UIFont systemFontOfSize:12 ]];
    [labelText setBackgroundColor:[UIColor clearColor] ];
    [self.view addSubview:labelText];
    
    _textFieldEmail = [[UITextField alloc ] initWithFrame:CGRectMake(SCREEN_WIDTH/2.20f,labelText.frame.origin.y, SCREEN_WIDTH/2, 40)];
    [_textFieldEmail setTextColor :[UIColor blackColor] ];
    [_textFieldEmail setFont:[UIFont systemFontOfSize:12 ]];
    [_textFieldEmail setBackgroundColor:[UIColor clearColor] ];
    [_textFieldEmail setPlaceholder:@"请输入邮箱"];
    [_textFieldEmail setTextAlignment:NSTextAlignmentRight];
    [self.view addSubview:_textFieldEmail];
    
    
    label = [[UILabel alloc ] initWithFrame:CGRectMake(0, label.frame.size.height+label.frame.origin.y+40, SCREEN_WIDTH, 1)];
    [label setBackgroundColor:RGB(221, 221, 221)];
    [self.view addSubview:label];
    
    labelText = [[UILabel alloc ] initWithFrame:CGRectMake(0, label.frame.size.height+label.frame.origin.y+10, SCREEN_WIDTH, 190)];
    [labelText setBackgroundColor:[UIColor whiteColor] ];
    [self.view addSubview:labelText];
    
    label = [[UILabel alloc ] initWithFrame:CGRectMake(20, label.frame.size.height+label.frame.origin.y+15, SCREEN_WIDTH, 16)];
    [label setText:@"意见反馈"];
    [label setTextColor :RGB(102, 102, 102)];
    [label setFont:[UIFont systemFontOfSize:12 ]];
    [self.view addSubview:label];
    
//    label = [[UILabel alloc ] initWithFrame:CGRectMake(0, label.frame.size.height+label.frame.origin.y+5, SCREEN_WIDTH, 1)];
//    [label setBackgroundColor:RGB(221, 221, 221)];
//    [self.view addSubview:label];
    
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
    if ([_textFieldName.text length] <= 0 )
    {
        [Tool showWarningTip:@"请输入姓名" view:self.view time:1];
        return;
    }
    if ([_textFieldTel.text length] <= 0 )
    {
        [Tool showWarningTip:@"请输入手机号" view:self.view time:1];
        return;
    }
    if ([_textFieldEmail.text length] <= 0 )
    {
        [Tool showWarningTip:@"请输入邮箱" view:self.view time:1];
        return;
    }
    if ([_textView.text length] <= 0 )
    {
        [Tool showWarningTip:@"请输入反馈意见" view:self.view time:1];
        return;
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
