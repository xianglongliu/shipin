//
// Created by 祥龙 on 15/8/14.
// Copyright (c) 2015 dust.zhang. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MessageModel : JSONModel

@property (nonatomic,strong) NSNumber<Optional> *id; //id

@property (nonatomic,strong) NSString<Optional> *title; //消息内容
@property (nonatomic,strong) NSString<Optional> *msg; //消息内容
@property (nonatomic,strong) NSString<Optional> *createTime; //创建时间
@property (nonatomic,strong) NSNumber<Optional> *updateTime; //修改时间

@property (nonatomic,assign) int status; //状态  1:保存手机号码 2:未审核 3:审核通过 4:审核失败

@end