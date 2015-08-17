//
// Created by 祥龙 on 15/8/14.
// Copyright (c) 2015 dust.zhang. All rights reserved.
//

#import "UserService.h"
#import "UserModel.h"
#import "HttpProtocol.h"
#import "MessageModel.h"
#import "DramaModel.h"


@protocol NSDictionary;

@implementation UserService {

}

IMP_SINGLETON(UserService)

+ (void)getUserDetail:(int)uId success:(void (^)(UserModel *userModel))success failure:(void (^)(NSDictionary *error))failure {

    NSDictionary* paramDict = @{@"uid":@(uId)};
    HttpProtocol *httpProtocol = [[HttpProtocol alloc] init];
    httpProtocol.method=@"get";
    //FIXME 替换token变量
    httpProtocol.token=[Config getToken];

    if(uId==0)
    {
        httpProtocol.param= nil;
    } else{
        httpProtocol.param=paramDict;
    }

    httpProtocol.requestUrl=[NSString stringWithFormat:@"%@",URL_USER_DETAIL];
    [[HttpManager sharedInstance] httpWithRequest:httpProtocol success:^(AFHTTPRequestOperation *operation, id responseObject){

        if([responseObject isKindOfClass:[NSDictionary class]])
        {
            NSLog(@"%@", [responseObject JSONString]);
            NSError* err = nil;
            UserModel *userModel = [[UserModel alloc] initWithString:[responseObject JSONString] error:&err];

            if(err!=nil)
            {
                NSLog(@"%@",err );
                if (failure)
                    failure(@{@"result":err});
            } else{

                if(success)
                {
                    success(userModel);
                }
            }
        }

    } failure:^(AFHTTPRequestOperation *operation, NSError *error){

        if (failure)
            failure(@{@"result":error});

    }];

}


+ (void)getPublishes:(void (^)(NSArray *dramaArray))success failure:(void (^)(NSDictionary *error))failure
{
    HttpProtocol *httpProtocol = [[HttpProtocol alloc] init];
    httpProtocol.requestUrl=[NSString stringWithFormat:@"%@",URL_MEPUBLISH];
    httpProtocol.param=nil;
    httpProtocol.method=@"get";
    //FIXME 替换token变量
    httpProtocol.token=[Config getToken];

    [[HttpManager sharedInstance] httpWithRequest:httpProtocol success:^(AFHTTPRequestOperation *operation, id responseObject){

        if([responseObject isKindOfClass:[NSDictionary class]])
        {
            NSArray<NSDictionary> *datum = [responseObject objectForKey:@"datum"];
            if(datum!=nil && [datum count]>0)
            {
                NSMutableArray *dramaArray= [[NSMutableArray alloc] init];
                for (NSDictionary *drama in datum)
                {
                    NSLog(@"dramaJson=%@", [drama JSONString]);
                    NSError* err = nil;
                    DramaModel *dramaModel = [[DramaModel alloc] initWithString:[drama JSONString] error:&err];

                    if(err!=nil)
                    {

                        NSLog(@"%@",err );
                    }
                    [dramaArray addObject:dramaModel];
                }

                if(success)
                    success(dramaArray);
            }

        }

    } failure:^(AFHTTPRequestOperation *operation, NSError *error){
        if(failure)
            failure(@{@"result":error});
    }];

}

+ (void)getCollections:(void (^)(NSArray *dramaArray))success failure:(void (^)(NSDictionary *error))failure {

    HttpProtocol *httpProtocol = [[HttpProtocol alloc] init];
    httpProtocol.requestUrl=[NSString stringWithFormat:@"%@",URL_COLLECTION];
    httpProtocol.param=nil;
    httpProtocol.method=@"get";
    //FIXME 替换token变量
    httpProtocol.token=[Config getToken];

    [[HttpManager sharedInstance] httpWithRequest:httpProtocol success:^(AFHTTPRequestOperation *operation, id responseObject){

        if([responseObject isKindOfClass:[NSDictionary class]])
        {
            NSArray<NSDictionary> *datum = [responseObject objectForKey:@"datum"];
            if(datum!=nil && [datum count]>0)
            {
                NSMutableArray *msgArray= [[NSMutableArray alloc] init];
                for (NSDictionary *msg in datum)
                {
                    NSString *dram= [msg objectForKey:@"drama"];
                    NSLog(@"msgJson=%@", [dram JSONString]);
                    NSError* err = nil;
                    DramaModel *msgModel = [[DramaModel alloc] initWithString:[dram JSONString] error:&err];

                    if(err!=nil)
                    {
                        if(failure)
                            failure(@{@"result":err});
                        NSLog(@"%@",err );
                    }
                    [msgArray addObject:msgModel];
                }

                if(success)
                    success(msgArray);
            }

        }

    } failure:^(AFHTTPRequestOperation *operation, NSError *error){
        if(failure)
            failure(@{@"result":error});
    }];

}

+(void)getMessages:(void (^)(NSArray *messageArray))success failure:(void (^)(NSDictionary *error))failure {


    HttpProtocol *httpProtocol = [[HttpProtocol alloc] init];
    httpProtocol.requestUrl=[NSString stringWithFormat:@"%@",URL_SYSYTEMMESSAGE];
    httpProtocol.param=nil;
    httpProtocol.method=@"get";
    //FIXME 替换token变量
    httpProtocol.token=[Config getToken];

    [[HttpManager sharedInstance] httpWithRequest:httpProtocol success:^(AFHTTPRequestOperation *operation, id responseObject)
    {
        if([responseObject isKindOfClass:[NSArray class]])
        {
            NSArray<NSDictionary> *datum = responseObject;
            if(datum!=nil && [datum count]>0)
            {
                NSMutableArray *msgArray= [[NSMutableArray alloc] init];
                for (NSDictionary *msg in datum)
                {
                    NSLog(@"msgJson=%@", [msg JSONString]);
                    NSError* err = nil;
                    MessageModel *msgModel = [[MessageModel alloc] initWithString:[msg JSONString] error:&err];

                    if(err!=nil)
                    {
                        if(failure)
                            failure(@{@"result":err});
                        NSLog(@"%@",err );
                    }
                    [msgArray addObject:msgModel];
                }

                if(success)
                    success(msgArray);
            }

        }

    } failure:^(AFHTTPRequestOperation *operation, NSError *error){
        if(failure)
            failure(@{@"result":error});
    }];

}


+ (void)sendPublish:(DramaModel *)dramaModel success:(void (^)(Boolean *boolean))success failure:(void (^)(NSDictionary *error))failure {

}

+ (void)addCollection:(int )dramaId success:(void (^)(Boolean *boolean))success failure:(void (^)(NSString *error))failure
{


    NSDictionary* paramDict = @{@"did":@(dramaId)};

    HttpProtocol *httpProtocol = [[HttpProtocol alloc] init];
    httpProtocol.requestUrl= [NSString stringWithFormat:@"%@",URL_ADD_COLLECTION];
    httpProtocol.param=paramDict;
    httpProtocol.method=@"post";
    //FIXME 替换token变量
    httpProtocol.token=[Config getToken];

    [[HttpManager sharedInstance] addHttpRequest:httpProtocol  success:^(AFHTTPRequestOperation *operation, Boolean *boolean){

        if(success)
            success(boolean);

    } failure:^(AFHTTPRequestOperation *operation, NSString *error){
        if(failure)
            failure(error);
    }];
}

+ (void)addFollow:(int )userId success:(void (^)(Boolean *boolean))success failure:(void (^)(NSString *error))failure {

    NSDictionary* paramDict = @{@"toUid":@(userId)};

    HttpProtocol *httpProtocol = [[HttpProtocol alloc] init];
    httpProtocol.requestUrl=[NSString stringWithFormat:@"%@",URL_ADD_FOLLOW];
    httpProtocol.param=paramDict;
    httpProtocol.method=@"post";
    //FIXME 替换token变量
    httpProtocol.token=[Config getToken];

    [[HttpManager sharedInstance] addHttpRequest:httpProtocol  success:^(AFHTTPRequestOperation *operation, Boolean *boolean){

        if(success)
            success(boolean);

    } failure:^(AFHTTPRequestOperation *operation, NSString *error){
        if(failure)
            failure(error);
    }];

}

+ (void)getFollows:(void (^)(NSArray *followArray))success failure:(void (^)(NSDictionary *error))failure {

    HttpProtocol *httpProtocol = [[HttpProtocol alloc] init];
    httpProtocol.requestUrl=[NSString stringWithFormat:@"%@",URL_USER_FOLLOWS];
    httpProtocol.param=nil;
    httpProtocol.method=@"get";
    //FIXME 替换token变量
    httpProtocol.token=[Config getToken];

    [[HttpManager sharedInstance] httpWithRequest:httpProtocol success:^(AFHTTPRequestOperation *operation, id responseObject){

        if([responseObject isKindOfClass:[NSArray class]])
        {
            if(responseObject!=nil && [responseObject count]>0)
            {
                NSMutableArray *msgArray= [[NSMutableArray alloc] init];
                for (NSDictionary *msg in responseObject)
                {
                    NSLog(@"msgJson=%@", [msg JSONString]);
                    NSError* err = nil;
                    UserModel *msgModel = [[UserModel alloc] initWithString:[msg JSONString] error:&err];

                    if(err!=nil)
                    {
                        if(failure)
                            failure(@{@"result":err});
                        NSLog(@"%@",err );
                    }
                    [msgArray addObject:msgModel];
                }

                if(success)
                    success(msgArray);
            }

        }

    } failure:^(AFHTTPRequestOperation *operation, NSError *error){
        if(failure)
            failure(@{@"result":error});
    }];
}


@end