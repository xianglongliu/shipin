//
//  Config.m
//  movikr
//
//  Created by Mapollo27 on 15/5/29.
//  Copyright (c) 2015年 movikr. All rights reserved.
//

#import "Config.h"

@implementation Config

/**
 *  保存用户名，无返回值
 *
 *  @param name 要保存的用户名
 */
+(void) saveUserName:(NSString *)name;
{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    [user setValue:name forKey:@"username"];
    [user synchronize];
}

/**
 *  读取用户名
 *
 *  @return 返回nsstring类型用户名
 */
+(NSString *) getUserName
{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    return [user objectForKey:@"username"];
}

/**
 *  保存登录缓存安全码
 *
 *  @param c 登录缓存安全码
 */
+(void) saveUserCredential:(NSString *)credential;
{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    [user setValue:credential forKey:@"userCredential"];
}

/**
 *  读取登录缓存安全码
 *
 *  @return 登录缓存安全码
 */
+(NSString *) getUserCredential
{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    return [user objectForKey:@"userCredential"];
}

/**
 *  删除用户对象
 */
+(void)delUser
{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    [user removeObjectForKey:@"userCredential"];
    [user removeObjectForKey:@"loginstatus"];
    [user removeObjectForKey:@"userId"];
}


+(NSString*) getWeiboTokenDate
{
    NSUserDefaults * settings = [NSUserDefaults standardUserDefaults];
    return [settings objectForKey:@"weibotokenDate"];
}

///**
// *  保存微博登陆信息
// *
// *  @return
// */
//+(void) saveWeiboToken:(NSString*)token date:(NSDate*)curDate
//{
//}

+(NSString*) getWeiboToken
{
    return @"";
}

/**
 *  得到浏览过的晨钟暮鼓ID
 */
+(NSString*)getSeenRecommendIds{
    NSUserDefaults * settings = [NSUserDefaults standardUserDefaults];
    return [settings objectForKey:@"seenRecommendIds"];
}

/**
 *  设置浏览过的暮鼓晨钟ID
 */
+(void)setSeenRecommendIds:(NSString*)seenRecommendIds{
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    [settings setValue:seenRecommendIds forKey:@"seenRecommendIds"];
}

/**
 *  得到晨钟的更新时间
 */
+(NSString*)getMorningRecommendUpdateOfTime{
    NSUserDefaults * settings = [NSUserDefaults standardUserDefaults];
    return [settings objectForKey:@"morningRecommendUpdatetime"];
}

+(void)setMorningRecommendUpdateOfTime:(NSString *)updatetime{
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    [settings setValue:updatetime forKey:@"morningRecommendUpdatetime"];

}

/**
 *  得到暮鼓的更新时间
 */
+(NSString*)getNightRecommendUpdateOfTime{
    NSUserDefaults * settings = [NSUserDefaults standardUserDefaults];
    return [settings objectForKey:@"nightRecommendUpdatetime"];
}

+(void)setNightRecommendUpdateOfTime:(NSString *)updatetime{
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    [settings setValue:updatetime forKey:@"nightRecommendUpdatetime"];
}

/**
 *  得到浏览过的文章ID
 */
+(NSString*)getSeenArticleIds{
    NSUserDefaults * settings = [NSUserDefaults standardUserDefaults];
    return [settings objectForKey:@"seenArticleIds"];
}

/**
 *  设置浏览过的文章ID
 */
+(void)setSeenArticleIds:(NSString *)seenArticleIds{
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    [settings setValue:seenArticleIds forKey:@"seenArticleIds"];
}

//保存登陆状态
+(void) saveLoginStatus:(BOOL) flag
{
    if(flag) {
        NSUserDefaults *loginstatus = [NSUserDefaults standardUserDefaults];
        [loginstatus setValue:@"YES" forKey:@"loginstatus"];
        [loginstatus synchronize];
    } else {
        NSUserDefaults *loginstatus = [NSUserDefaults standardUserDefaults];
        [loginstatus setValue:@"NO" forKey:@"loginstatus"];
        [loginstatus synchronize];
    }
}

//判断登陆状态
+(BOOL) JudgeLoginStatus
{
    NSUserDefaults * loginstatus = [NSUserDefaults standardUserDefaults];
    if ([[loginstatus objectForKey:@"loginstatus"] isEqual:@"YES" ])
    {
        return TRUE;
    }
    else
    {
        return FALSE;
    }
    return FALSE;
}

/**
 *  保存用户默认影院ID
 */
+(void)setUserCinema:(NSDictionary *)cinema{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    [user setValue:cinema forKey:@"userCinema"];
    [user synchronize];
}

/**
 *  获取用户默认影院ID
 */
+(NSDictionary *)getUserCinema{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    return [user objectForKey:@"userCinema"];
}

/**
 *  保存用户ID
 */
+(void)setUserId:(NSNumber *)userId{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    [user setValue:userId forKey:@"userId"];
}

/**
 *  获取用户ID
 */
+(NSInteger)getUserId{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    return [[user objectForKey:@"userId"] integerValue];
}

+(NSString *)getDeviceToken{
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    return [settings objectForKey:@"deviceToken"];
}

+(void)setDeviceToken:(NSString *)deviceToken{
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    [settings setValue:deviceToken forKey:@"deviceToken"];
    [settings synchronize];
}


@end
