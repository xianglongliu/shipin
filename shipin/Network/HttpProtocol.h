//
// Created by 祥龙 on 15/8/14.
// Copyright (c) 2015 kinstalk.com. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface HttpProtocol : NSObject

//请求url
@property(nonatomic, assign) NSString * requestUrl;
//请求方式 get or post
@property(nonatomic, assign) NSString * method;
//请求参数
@property(nonatomic, assign)  NSDictionary* param;
//请求token
@property(nonatomic, assign) NSString * token;
//请求deviceId
@property(nonatomic, assign) NSString * deviceId;

@end