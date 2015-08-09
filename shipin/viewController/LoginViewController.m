//
//  LoginViewController.m
//  shipin
//
//  Created by zhangjingfei on 9/8/15.
//  Copyright (c) 2015年 dust.zhang. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImageView *imageViewBg = [[UIImageView alloc ] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [imageViewBg setImage:[UIImage imageNamed:@"bg-login.png"] ];
    [self.view addSubview:imageViewBg];
    
    UIImageView *imageViewLogo = [[UIImageView alloc ] initWithFrame:CGRectMake(SCREEN_WIDTH-220, 120, 110, 60)];
    [imageViewLogo setImage:[UIImage imageNamed:@"logo.png"] ];
    [self.view addSubview:imageViewLogo];
    
    UILabel *labelName = [[UILabel alloc ] initWithFrame:CGRectMake(0, imageViewLogo.frame.size.height+imageViewLogo.frame.origin.y+10, SCREEN_WIDTH, 20)];
    [labelName setText:@"中国首个电视剧交易平台"];
    [labelName setBackgroundColor:[UIColor clearColor]];
    [labelName setFont:[UIFont boldSystemFontOfSize:14]];
    [labelName setTextAlignment:NSTextAlignmentCenter];
    [labelName setTextColor:[UIColor whiteColor]];
    [self.view addSubview:labelName];
//    手机号
    textTel = [[UITextField alloc ] initWithFrame:CGRectMake(25, labelName.frame.size.height+labelName.frame.origin.y+80, 180, 37)];
    [textTel setPlaceholder:@"  请输入您的手机号码"];
    [textTel setFont:[UIFont systemFontOfSize:12]];
    [textTel setBackgroundColor:[UIColor whiteColor]];
    textTel.layer.masksToBounds = YES;
    textTel.layer.cornerRadius = 3;
    [self.view addSubview:textTel];
//    获取验证码
    UIButton *btnGetICode = [[UIButton alloc ] initWithFrame:CGRectMake(textTel.frame.size.width+textTel.frame.origin.x+10, textTel.frame.origin.y, 80, textTel.frame.size.height)];
    [btnGetICode setBackgroundColor:yellowRgb];
    btnGetICode.layer.masksToBounds = YES;
    btnGetICode.layer.cornerRadius = 3;
    [btnGetICode setTitle:@"获取验证码" forState:UIControlStateNormal];
    [btnGetICode.titleLabel setFont:[UIFont systemFontOfSize:12]];
    [btnGetICode addTarget:self action:@selector(onButtonGetICode) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnGetICode];
//    验证码
    textIdentifyingCode = [[UITextField alloc ] initWithFrame:CGRectMake(25, textTel.frame.size.height+textTel.frame.origin.y+10, SCREEN_WIDTH-50, 37)];
    [textIdentifyingCode setPlaceholder:@"  请输入验证码"];
    [textIdentifyingCode setFont:[UIFont systemFontOfSize:12]];
    [textIdentifyingCode setBackgroundColor:[UIColor whiteColor]];
    textIdentifyingCode.layer.masksToBounds = YES;
    textIdentifyingCode.layer.cornerRadius = 3;
    [self.view addSubview:textIdentifyingCode];

//    是否同意协议
    UIButton *btnAgree = [[UIButton alloc ] initWithFrame:CGRectMake(25, textIdentifyingCode.frame.size.height+textIdentifyingCode.frame.origin.y+10, 15, 15)];
    [btnAgree setBackgroundImage:[UIImage imageNamed:@"uncheckawardblack.png"] forState:UIControlStateNormal];
    [btnAgree addTarget:self action:@selector(onButtonCheck) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnAgree];
    
    UILabel *labelAgreement = [[UILabel alloc ] initWithFrame:CGRectMake(btnAgree.frame.origin.x +25, btnAgree.frame.origin.y, SCREEN_WIDTH-100, 15)];
    [labelAgreement setText:@"我已阅读并同意《剧库用户协议》"];
    [labelAgreement setBackgroundColor:[UIColor clearColor]];
    [labelAgreement setTextColor:[UIColor whiteColor]];
    [labelAgreement setFont:[UIFont systemFontOfSize:12]];
    [self.view addSubview:labelAgreement];
    
//    登陆
    UIButton *btnLogin = [[UIButton alloc ] initWithFrame:CGRectMake(25, labelAgreement.frame.size.height+labelAgreement.frame.origin.y+10, textIdentifyingCode.frame.size.width,textIdentifyingCode.frame.size.height)];
    [btnLogin setBackgroundColor:yellowRgb];
    btnLogin.layer.masksToBounds = YES;
    btnLogin.layer.cornerRadius = 3;
    btnLogin.titleLabel.font = [UIFont systemFontOfSize:14];
    [btnLogin setTitle:@"登录" forState:UIControlStateNormal];
    [btnLogin addTarget:self action:@selector(onButtonLogin) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnLogin];

    
}

//同意协议
-(void) onButtonCheck
{
    
}

//获取验证码
-(void) onButtonGetICode
{
    
}

//登陆
-(void)onButtonLogin
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [textTel resignFirstResponder];
    [textIdentifyingCode resignFirstResponder];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
