//
// Created by 祥龙 on 15/8/14.
// Copyright (c) 2015 dust.zhang. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MyPublishModle : JSONModel

@property (nonatomic,strong) NSNumber<Optional> *id; //用户id
@property (nonatomic,strong) NSString<Optional> *name; //用户名称
@property (nonatomic,strong) NSString<Optional> *headImage; //用户头像

@property (nonatomic,strong) NSString<Optional> *image;//发布的内容图片url
@property (nonatomic,strong) NSString<Optional> *title;//标题
@property (nonatomic,strong) NSString<Optional> *content;//内容
@property (nonatomic,strong) NSString<Optional> *rendCount;//阅读量
@property (nonatomic,strong) NSString<Optional> *attentionCount;//关注量


@end