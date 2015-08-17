//
// Created by 祥龙 on 15/8/14.
// Copyright (c) 2015 dust.zhang. All rights reserved.
//

#import "DramaServices.h"
#import "HttpProtocol.h"
#import "HttpManager.h"
#import "DramaModel.h"


@protocol NSDictionary;

@implementation DramaServices

IMP_SINGLETON(DramaServices)

+ (void)pullDramaGoodData:(int)pageNum success:(void (^)(NSArray *array))success failure:(void (^)(NSDictionary *error))failure
{
    NSMutableArray *dramaArray= [[NSMutableArray alloc] init];
    NSDictionary* paramDict = @{@"page":@(pageNum)};

    HttpProtocol *httpProtocol = [[HttpProtocol alloc] init];
    httpProtocol.requestUrl=[NSString stringWithFormat:@"%@",URL_GOODDRAMA];
    httpProtocol.param=paramDict;
    httpProtocol.method=@"get";
    //FIXME 替换token变量
    httpProtocol.token=[Config getToken];

    [[HttpManager sharedInstance] httpWithRequest:httpProtocol success:^(AFHTTPRequestOperation *operation, id responseObject)
    {
        if([responseObject isKindOfClass:[NSDictionary class]])
        {
            NSArray<NSDictionary> *datum = [responseObject objectForKey:@"datum"];
            if(datum!=nil && [datum count]>0)
            {
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
        failure(@{@"result":error});
    }];
}

+ (void)getDramaDetail:(int)dId success:(void (^)(id dramaModel))success
                                failure:(void (^)( NSDictionary *error))failure{

    @try{

        NSDictionary* paramDict = @{@"did":@(dId)};
        HttpProtocol *httpProtocol = [[HttpProtocol alloc] init];
        httpProtocol.method=@"get";
        //FIXME 替换token变量
        httpProtocol.token=[Config getToken];
        httpProtocol.param=paramDict;
        httpProtocol.requestUrl=[NSString stringWithFormat:@"%@",URL_DETIAL];
        [[HttpManager sharedInstance] httpWithRequest:httpProtocol success:^(AFHTTPRequestOperation *operation, id responseObject){

            if([responseObject isKindOfClass:[NSDictionary class]])
            {
                NSLog(@"%@", [responseObject JSONString]);
                NSError* err = nil;
                DramaModel *dramaModel = [[DramaModel alloc] initWithString:[responseObject JSONString] error:&err];

                if(err!=nil)
                {
                    NSLog(@"%@",err );

                } else{

                    if(success)
                    {
                        success(dramaModel);
                    }
                }
            }

        } failure:^(AFHTTPRequestOperation *operation, NSError *error){

            if (failure)
                failure(@{@"result":error});

        }];


    }@catch (NSException *exception) {

        NSLog(@"initFromServer error:%@", [exception description]);
    }

}


+ (void)pullAllDramaList:(int)pageNum success:(void (^)(NSArray *array))success failure:(void (^)(NSDictionary *error))failure {

    NSDictionary* paramDict = @{@"page":@(pageNum)};

    HttpProtocol *httpProtocol = [[HttpProtocol alloc] init];

    httpProtocol.requestUrl=[NSString stringWithFormat:@"%@",URL_ALLDRAMA];
    httpProtocol.param=paramDict;
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


@end