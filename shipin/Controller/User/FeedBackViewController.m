//
//  FeedBackViewController.m
//  shipin
//
//  Created by Mapollo27 on 15/8/15.
//  Copyright (c) 2015年 dust.zhang. All rights reserved.
//

#import "FeedBackViewController.h"

#define MinNumberOfLines 1
#define MaxNumberOfLines 7

@interface FeedBackViewController ()

@end

@implementation FeedBackViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[UIApplication  sharedApplication] setStatusBarHidden:NO];
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
    
    UILabel *label = [[UILabel alloc ] initWithFrame:CGRectMake(10, TABBAR_HEIGHT+10, SCREEN_WIDTH, 16)];
    [label setText:@"意见反馈"];
    [label setTextColor :RGB(102, 102, 102)];
    [label setFont:[UIFont systemFontOfSize:12 ]];
    [self.view addSubview:label];
    
    hpTextView = [[HPGrowingTextView alloc] initWithFrame:CGRectMake(10, label.frame.size.height+label.frame.origin.y+5, SCREEN_WIDTH-20, 100)];
    hpTextView.isScrollable = NO;
    [hpTextView.internalTextView.layer setCornerRadius:3];
    hpTextView.minNumberOfLines = MinNumberOfLines;
    hpTextView.maxNumberOfLines = MaxNumberOfLines;
    hpTextView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    hpTextView.internalTextView.enablesReturnKeyAutomatically = YES;
    //    hpTextView.textAlignment = NSTextAlignmentJustified;
    hpTextView.animateHeightChange = NO;
    hpTextView.returnKeyType = UIReturnKeyDefault; //just as an example
    hpTextView.font = [UIFont systemFontOfSize:14.0f];
    hpTextView.delegate = self;
    //hpTextView.internalTextView.scrollIndicatorInsets = UIEdgeInsetsMake(0, 5, 0, 5);
    hpTextView.internalTextView.backgroundColor = [UIColor whiteColor];
    hpTextView.placeholder = @"请输入反馈意见";
    
    [self.view addSubview:hpTextView];

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
    if ([hpTextView.text length] <= 0 )
    {
        [Tool showWarningTip:@"请输入反馈意见" view:self.view time:1];
        return;
    }
    else
    {
        [UserService opinion:hpTextView.text success:^(Boolean *boolean)
        {
            hpTextView.text=@"";
            [Tool showWarningTip:@"感谢反馈" view:self.view time:1];
        } failure:^(NSString *error) {
            [Tool showWarningTip:@"提交失败" view:self.view time:1];
        }];
    }
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [hpTextView resignFirstResponder];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
