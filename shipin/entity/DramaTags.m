//
// Created by 祥龙 on 15/8/27.
// Copyright (c) 2015 dust.zhang. All rights reserved.
//

#import "DramaTags.h"


@implementation DramaTags {

}

//主键
+(NSArray*) getPrimaryKeyUnionArray
{
    return @[@"id"];
}
//表名
+(NSString *)getTableName
{
    return @"t_tags";
}
@end