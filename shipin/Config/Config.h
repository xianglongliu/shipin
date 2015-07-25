//
//  Config.h
//  movikr
//
//  Created by Mapollo27 on 15/5/29.
//  Copyright (c) 2015年 movikr. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Config : NSObject


//保存用户名
+(void) saveUserName:(NSString *)name;

//读取用户名
+(NSString *) getUserName;

//删除已登录的用户名，密码
+(void)delUser;

//保存登录缓存安全码
+(void) saveUserCredential:(NSString *)credential;

//读取登录缓存安全码
+(NSString *) getUserCredential;

///保存微博登陆信息
//+(void) saveWeiboToken:(NSString*)token date:(NSDate*)curDate;

///获取微博token
+(NSString*) getWeiboToken;

///获取微博token日期
+(NSString*) getWeiboTokenDate;

///得到浏览过的晨钟暮鼓ID
+(NSString*) getSeenRecommendIds;
///设置浏览过的晨钟暮鼓的ID
+(void) setSeenRecommendIds:(NSString*)seenRecommendIds;

///得到浏览过的文章ID
+(NSString*) getSeenArticleIds;
///设置浏览过的文章ID
+(void) setSeenArticleIds:(NSString*)seenArticleIds;

///得到晨钟更新的时间
+(NSString*)getMorningRecommendUpdateOfTime;
///设置晨钟的更新时间
+(void) setMorningRecommendUpdateOfTime:(NSString*)udpatetime;

///得到暮鼓更新的时间
+(NSString*)getNightRecommendUpdateOfTime;
///设置暮鼓的更新时间
+(void) setNightRecommendUpdateOfTime:(NSString*)udpatetime;

//保存登陆状态
+(void) saveLoginStatus:(BOOL) flag;
//判断登陆状态
+(BOOL) JudgeLoginStatus;

//保存用户默认影院ID
+(void)setUserCinema:(NSDictionary *)cinema;
//获取用户默认影院ID
+(NSDictionary *)getUserCinema;

//保存用户ID
+(void)setUserId:(NSNumber *)userId;
//获取用户ID
+(NSInteger)getUserId;

+(void)setDeviceToken:(NSString*)deviceToken;
+(NSString*)getDeviceToken;

@end