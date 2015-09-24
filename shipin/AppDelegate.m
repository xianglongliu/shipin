//
//  AppDelegate.m
//  shipin
//
//  Created by Mapollo27 on 15/7/17.
//  Copyright (c) 2015年 dust.zhang. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "ExUINavigationController.h"
#import "GuideViewController.h"
#import "ShareView.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    if(![[Config getFirstLoginState] isEqualToString:@"YES"])
    {
        GuideViewController *mainView = [[GuideViewController alloc]init];
        ExUINavigationController *nav =[[ExUINavigationController alloc]initWithRootViewController:mainView];
        self.window.rootViewController = nav;
    }
    else
    {
        ViewController *mainView = [[ViewController alloc]init];
        ExUINavigationController *nav =[[ExUINavigationController alloc]initWithRootViewController:mainView];
        self.window.rootViewController = nav;
    }
    [self.window makeKeyAndVisible];
    
    [self initShareSdkKey];
    
    return YES;

}


#pragma mark    处理分享
-(void) initShareSdkKey
{
    //微信注册
    [WXApi registerApp:weixinAppId withDescription:@"juku"];
    //新浪微博注册
    [WeiboSDK enableDebugMode:NO];
    [WeiboSDK registerApp:weiboAppKey];
    //QQ注册
//    tencentOAuth = [[TencentOAuth alloc] initWithAppId:TencentAppId andDelegate:(id)[ShareView getShareInstance]];
}


-(BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    if([url.scheme isEqualToString:weixinAppId])
    {
        return [WXApi handleOpenURL:url delegate:(id)[ShareView getShareInstance]];
    }
    else if([url.scheme isEqualToString:weiboAppId])
    {
        return [WeiboSDK handleOpenURL:url delegate:(id)[ShareView getShareInstance]];
    }
//    else if([url.scheme isEqualToString:QQAppId])
//    {
//        return [QQApiInterface handleOpenURL:url delegate:(id)[ShareView getShareInstance]];
//    }
    return YES;
}

-(BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    if([url.scheme isEqualToString:weiboAppId])
    {
        return [WeiboSDK handleOpenURL:url delegate:(id)[ShareView getShareInstance]];
    }
//    else if([url.scheme isEqualToString:QQAppId])
//    {
//        return [QQApiInterface handleOpenURL:url delegate:(id)[ShareView getShareInstance]];
//    }
    return YES;
}


@end
