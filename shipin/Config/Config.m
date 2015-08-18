//
//  Config.m
//  movikr
//
//  Created by Mapollo27 on 15/5/29.
//  Copyright (c) 2015年 movikr. All rights reserved.
//

#import "Config.h"

@implementation Config


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

//+(void) saveUserId:(NSString *)userid;
//{
//    NSUserDefaults *userid = [NSUserDefaults standardUserDefaults];
//    [userid setValue:userid forKey:@"userid"];
//    [userid synchronize];
//}
//
//+(NSString *) getUserId
//{
//    NSUserDefaults *uuseridser = [NSUserDefaults standardUserDefaults];
//    return [userid objectForKey:@"userid"];
//}

@end
