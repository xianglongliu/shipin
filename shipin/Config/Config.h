//
//  Config.h
//  movikr
//
//  Created by Mapollo27 on 15/5/29.
//  Copyright (c) 2015年 movikr. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Config : NSObject

//保存userId
+(void) saveUserId:(NSString *)name;
+(NSString *) getUserId;
//保存手机号
+(void) saveUserName:(NSString *)name;
+(NSString *) getUserName;
//保存登陆标示
+(void) saveLoginFlag:(NSString *)flag;
+(NSString *) getLoginFlag;
//保存token
+(void) saveToken:(NSString *)flag;
+(NSString *) getToken;
//判断是否从登陆跳转
+(NSString *) getIsLogin;
+(void) saveIsLogin:(NSString *)flag;
//用户是否上传头像
+(NSString *)getUpdateUserHeadImage;
+(void)setUpdateUserHeadImage:(NSString *)flag;

+(NSString *)getFirstLoginState;
+(void)saveFirstLogin:(NSString *)state;


@end