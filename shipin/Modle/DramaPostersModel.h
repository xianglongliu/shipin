//
// Created by 祥龙 on 15/8/14.
// Copyright (c) 2015 dust.zhang. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DramaPostersModel : JSONModel

@property (nonatomic,assign) NSNumber<Optional> *did;
@property (nonatomic,strong) NSNumber<Optional> *id;
@property (nonatomic,strong) NSString<Optional> *poster;
@property (nonatomic,strong) NSNumber<Optional> *createTime;
@property (nonatomic,assign) NSNumber<Optional> *updateTime;



@end