//
// Created by 祥龙 on 15/8/14.
// Copyright (c) 2015 dust.zhang. All rights reserved.
//

#import <Foundation/Foundation.h>


//相似剧集
@interface SimilaritiesModel : JSONModel
@property (nonatomic,assign) NSNumber<Optional>*  Id; //据库id
@property (nonatomic,strong) NSString<Optional>*  cover; //封面url
@property (nonatomic,strong) NSString<Optional>*  name; //名称
@property (nonatomic,strong) NSString<Optional>*  url; //连接
@end