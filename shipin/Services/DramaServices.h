//
// Created by 祥龙 on 15/8/14.
// Copyright (c) 2015 dust.zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseService.h"
#import "HttpManager.h"

@interface DramaServices : BaseService

DEF_SINGLETON(DramaServices)

//获取发现频道数据，传指定页码
-(void) pullDramaGoodData:(int)pageNum success:(void (^)(NSArray * array))success
                                       failure:(void (^)( NSDictionary *error))failure;

//获取全部数据列表
-(void)pullAllDramaList:(int)pageNum success:(void (^)(NSArray * array))success
                                     failure:(void (^)( NSDictionary *error))failure;
//根据id获取剧目详情
-(void)getDramaDetail:(int)dId success:(void (^)(id dramaModel))success
                               failure:(void (^)( NSDictionary *error))failure;




@end