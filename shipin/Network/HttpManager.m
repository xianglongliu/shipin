//
// Created by 祥龙 on 15/8/14.
// Copyright (c) 2015 kinstalk.com. All rights reserved.
//

#import "HttpManager.h"
#import "HttpProtocol.h"
#import "AFHTTPRequestOperationManager.h"
#import "AFURLRequestSerialization.h"
#import "HttpResultBase.h"
#import "AFHTTPRequestOperation.h"

@interface HttpManager (){


    HttpProtocol * _httpProtocol;
}
@end

@implementation HttpManager {

}
//重试3次
#define knumberOfRetryAttempts 3
#define OBJ_IS_NIL(s) (s==nil || [NSNull isEqual:s] || [s class]==nil || [@"<null>" isEqualToString:[s description]] ||[@"(null)" isEqualToString:[s description]])

IMP_SINGLETON(HttpManager)
- (void)initHttps
{

    //init https
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy defaultPolicy];
    securityPolicy.allowInvalidCertificates = YES;
    _manager.securityPolicy = securityPolicy;
}

- (id)init
{
    self = [super init];
    if( self )
    {
        _manager = [AFHTTPRequestOperationManager manager];

        _requestSerializer = [AFHTTPRequestSerializer serializer];

        _upProtolQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);

        _request = nil;

        [self initHttps];
    }
    return self;
}

- (NSMutableURLRequest*)createRequest:(HttpProtocol *)httpProtocol
{
     _httpProtocol = httpProtocol;
    NSString* method = httpProtocol.method;

    _request = [self.requestSerializer requestWithMethod:method
                                               URLString:httpProtocol.requestUrl
                                              parameters:httpProtocol.param
                                                   error:nil];
    if (httpProtocol.token != nil) {

        [_request setValue:httpProtocol.token forHTTPHeaderField:@"token"];
    }

    if (httpProtocol.deviceId != nil) {

        [_request setValue:httpProtocol.deviceId forHTTPHeaderField:@"deviceId"];
    }

    [_request setValue:@"gzip" forHTTPHeaderField:@"Accept-Encoding"];


    return _request;
}

- (void)httpWithRequest:(HttpProtocol *)qinHttpProtocol success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                                                           failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure {

    NSURLRequest* request = [self createRequest:qinHttpProtocol];


    AFHTTPRequestOperation* op = [_manager HTTPRequestOperationWithRequest:request success:^(AFHTTPRequestOperation *operation1, id responseObject1) {

        NSURLRequest* request = [operation1 request];
        NSLog(@"[%@]%@\nHeader:%@\nBody:%@", request.HTTPMethod, request.URL, request.allHTTPHeaderFields, [[NSString alloc] initWithData:request.HTTPBody  encoding:NSUTF8StringEncoding]);


        if (!OBJ_IS_NIL(responseObject1)) {

            if ([responseObject1 isKindOfClass:[NSData class]]) {

                NSLog(@"------");

            }
            else if ([responseObject1 isKindOfClass:[NSString class]]) {

            }
            else if ([responseObject1 isKindOfClass:[NSArray class]]) {

            }
            else if ([responseObject1 isKindOfClass:[NSDictionary class]]) {

                if( !OBJ_IS_NIL([responseObject1 objectForKey:@"code"]) && [[responseObject1 objectForKey:@"code"]integerValue] == 0 )

                {
                    NSLog(@"Request获取成功");

                    HttpResultBase *resultBase = [[HttpResultBase alloc] init];

                    resultBase.code =[[responseObject1 objectForKey:@"code"] intValue] ;

                    resultBase.data =[responseObject1 objectForKey:@"data"];

                    if( SUCCESS_CODE == resultBase.code){
                        NSLog(@"Request获取成功");

                        if( success )
                            success(operation1,resultBase.data);
                    }
                    else if( ERROR_CODE_ONE == resultBase.code  )
                    {
                        NSLog(@"不明错误");


                        if( failure )
                            failure(operation1,resultBase.data);
                    }else if( ERROR_CODE_101 == resultBase.code  )
                    {
                        NSLog(@"用户被屏蔽");


                        if( failure )
                            failure(operation1,resultBase.data);
                    }else if( ERROR_CODE_102 == resultBase.code  )
                    {
                        NSLog(@"用户未登陆");


                        if( failure )
                            failure(operation1,resultBase.data);
                    }else if( ERROR_CODE_103 == resultBase.code  )
                    {
                        NSLog(@"用户重复登陆");


                        if( failure )
                            failure(operation1,resultBase.data);
                    }else if( ERROR_CODE_104 == resultBase.code  )
                    {
                        NSLog(@"登陆验证码错误");


                        if( failure )
                            failure(operation1,resultBase.data);
                    }else if( ERROR_CODE_105 == resultBase.code  )
                    {
                        NSLog(@"token生成错误");


                        if( failure )
                            failure(operation1,resultBase.data);
                    }

                }

            }

        }



    } failure:^(AFHTTPRequestOperation *operation2, NSError *error) {

        NSLog(@"Request获取失败");

        NSURLRequest* request = [operation2 request];
        NSLog(@"[%@]%@\nHeader:%@\nBody:%@\nError:%@", request.HTTPMethod, request.URL, request.allHTTPHeaderFields, [[NSString alloc] initWithData:request.HTTPBody  encoding:NSUTF8StringEncoding],error);

//            @try
        {
            if (error.code == -1005) {

            } else {
                NSLog(@"Error during connection: %@",error.description);
                   failure(operation2, error);
            }

                if( failure )
                    failure(operation2,error);
        }

    }];

    [op start];

}



- (void)dealloc
{

    _upProtolQueue = nil;

}


@end