//
// Created by 祥龙 on 15/8/14.
// Copyright (c) 2015 dust.zhang. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UserModel : JSONModel

@property (nonatomic,strong) NSNumber<Optional> *id; //用户id

@property (nonatomic,strong) NSString<Optional> *name; //用户名称

@property (nonatomic,strong) NSString<Optional> *avatar; //用户头像

@property (nonatomic,strong) NSString<Optional> *brief; //简介
@property (nonatomic,strong) NSString<Optional> *corporation; //公司名称

@property (nonatomic,strong) NSString<Optional> *position; //职位

@property (nonatomic,strong) NSString<Optional> *mobile; //电话

@property (nonatomic,strong) NSString<Optional> *email; //邮箱

@property (nonatomic,strong) NSNumber<Optional> *createTime; //创建时间
@property (nonatomic,strong) NSNumber<Optional> *updateTime; //修改时间

@property (nonatomic,assign) int status; //状态  1未审核 2审核
@end