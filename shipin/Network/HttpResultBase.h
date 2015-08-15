//
// Created by 祥龙 on 15/8/14.
// Copyright (c) 2015 kinstalk.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpResultBase :NSObject {
}

//状态值
@property (nonatomic, assign) int code;
//数据内容
@property (nonatomic, strong) id data;

@end
