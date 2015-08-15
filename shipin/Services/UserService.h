//
// Created by 祥龙 on 15/8/14.
// Copyright (c) 2015 dust.zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HttpManager.h"

@class UserModel;
@class DramaModel;


@interface UserService : NSObject
DEF_SINGLETON(UserService)

//根据uId获取用户信息，uId=0获取自己的信息
-(void) getUserDetail:(int)uId success:(void (^)(UserModel * userModel))success
        failure:(void (^)( NSDictionary *error))failure;

//我的发布
-(void) getPublishes: (void (^)(NSArray * dramaArray))success
              failure:(void (^)( NSDictionary *error))failure;

//我的收藏NO
-(void) getCollections: (void (^)(NSArray * dramaArray))success
             failure:(void (^)( NSDictionary *error))failure;

//系统消息
-(void) getMessages: (void (^)(NSArray * messageArray))success
               failure:(void (^)( NSDictionary *error))failure;


//发布剧目NO
-(void) sendPublish:(DramaModel *)dramaModel success:(void (^)(Boolean * boolean))success
            failure:(void (^)( NSDictionary *error))failure;


//添加收藏NO
-(void) addCollection:(int *)dramaId success:(void (^)(Boolean * boolean))success
            failure:(void (^)( NSDictionary *error))failure;

//添加关注NO
-(void) addCollect:(int *)userId success:(void (^)(Boolean * boolean))success
              failure:(void (^)( NSDictionary *error))failure;

@end