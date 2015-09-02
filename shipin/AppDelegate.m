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
        [Config saveFirstLogin:@"YES"];
    }
    else
    {
        ViewController *mainView = [[ViewController alloc]init];
        ExUINavigationController *nav =[[ExUINavigationController alloc]initWithRootViewController:mainView];
        self.window.rootViewController = nav;
    }
    [self.window makeKeyAndVisible];
    return YES;

}

@end
