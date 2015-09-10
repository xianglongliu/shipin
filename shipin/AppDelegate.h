//
//  AppDelegate.h
//  shipin
//
//  Created by Mapollo27 on 15/7/17.
//  Copyright (c) 2015年 dust.zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeiboSDK.h"
#import "WXApi.h"
#import <TencentOpenAPI/TencentOAuth.h>
#import <TencentOpenAPI/QQApiInterface.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
     TencentOAuth *tencentOAuth;
}
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSString *wbtoken;

@end

