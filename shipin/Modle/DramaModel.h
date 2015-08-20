//
// Created by 祥龙 on 15/8/14.
// Copyright (c) 2015 dust.zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DramaOpModel;


@protocol DramaPostersModel;

@protocol ScreenShotsModel;

@protocol SimilaritiesModel;

@protocol DramaRelativesModel;

@interface DramaModel : JSONModel

@property (nonatomic,strong) NSNumber<Optional> *id; //剧目id
@property (nonatomic,strong) NSNumber<Optional> *uId; //用户id
@property (nonatomic,strong) NSString<Optional> *username; //用户名称
@property (nonatomic,strong) NSString<Optional> *avatar; //用户头像
@property (nonatomic,strong) NSString<Optional> *name; //剧目名称
@property (nonatomic,strong) NSString<Optional> *brief; //简介
@property (nonatomic,strong) NSArray<Optional,DramaPostersModel>* posters; //封面图集（view中只取第一张）
@property (nonatomic,assign) NSNumber<Optional> *type; //类型
@property (nonatomic,strong) NSString<Optional> *recommend; //推荐语
@property (nonatomic,strong) DramaOpModel<Optional> *dramaOp; //阅读和关注数量
@property (nonatomic,strong) NSArray<Optional,ScreenShotsModel> *screenShots; //图集
@property (nonatomic,strong) NSString<Optional> *trailerUrl; //预告片地址
@property (nonatomic,strong) NSString<Optional> *director; //导演
@property (nonatomic,strong) NSString<Optional> *staring; //主演
@property (nonatomic,strong) NSString<Optional> *district; //地区
@property (nonatomic,strong) NSString<Optional> *language; //语言
@property (nonatomic,strong) NSString<Optional> *premiere; //首播时间
@property (nonatomic,strong) NSArray<Optional,SimilaritiesModel> *similarities; //相似剧集
@property (nonatomic,strong) NSArray<Optional,DramaRelativesModel> *dramaRelatives; //相关资料
@property (nonatomic,assign) NSNumber<Optional> *status; //状态  1未审核 2审核

@end


//相关操作
@interface DramaOpModel : JSONModel

@property (nonatomic,assign) NSNumber<Optional> *did; //关注数
@property (nonatomic,strong) NSNumber<Optional> *createTime; //创建时间
@property (nonatomic,strong) NSNumber<Optional> *updateTime; //修改时间
@property (nonatomic,assign) NSNumber<Optional> *collects; //关注数
@property (nonatomic,assign) NSNumber<Optional> *clicks; //阅读数

@end












