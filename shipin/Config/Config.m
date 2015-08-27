//
//  Config.m
//  movikr
//
//  Created by Mapollo27 on 15/5/29.
//  Copyright (c) 2015年 movikr. All rights reserved.
//

#import "Config.h"

@implementation Config

+(void) saveUserId:(NSString *)userId;
{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    [user setValue:userId forKey:@"userId"];
    [user synchronize];
}

+(NSString *) getUserId
{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    return [user objectForKey:@"userId"];
}
+(void) saveUserName:(NSString *)name;
{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    [user setValue:name forKey:@"username"];
    [user synchronize];
}

+(NSString *) getUserName
{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    return [user objectForKey:@"username"];
}

+(void) saveLoginFlag:(NSString *)flag
{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    [user setValue:flag forKey:@"loginfalg"];
    [user synchronize];
}

+(NSString *) getLoginFlag
{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    return [user objectForKey:@"loginfalg"];
}

+(void) saveToken:(NSString *)flag
{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    [user setValue:flag forKey:@"token"];
    [user synchronize];
}
+(NSString *) getToken
{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    return [user objectForKey:@"token"];
}

+(NSString *) getIsLogin
{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    return [user objectForKey:@"isLogin"];
}

+(void) saveIsLogin:(NSString *)flag
{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    [user setValue:flag forKey:@"isLogin"];
    [user synchronize];
}

+(NSString *)getUpdateUserHeadImage
{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    return [user objectForKey:@"isUploadimage"];
}
+(void)setUpdateUserHeadImage:(NSString *)flag
{
    NSUserDefaults *upload = [NSUserDefaults standardUserDefaults];
    [upload setValue:flag forKey:@"isUploadimage"];
    [upload synchronize];
}

@end
