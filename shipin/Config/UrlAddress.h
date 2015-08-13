//
//  UrlAddress.h
//  movikr
//
//  Created by Mapollo27 on 15/5/29.
//  Copyright (c) 2015年 movikr. All rights reserved.
//



#define     URL_SERVERADDRESS   @"http://182.92.102.39:8080"
//获取验证码
#define     URL_VERIFYCODE  [URL_SERVERADDRESS stringByAppendingString:@"/user/verifyCode"]
//登录
#define     URL_LOGIN  [URL_SERVERADDRESS stringByAppendingString:@"/user/login"]
//全部剧目
#define     URL_ALLDRAMA  [URL_SERVERADDRESS stringByAppendingString:@"/drama/"]
//发现好剧
#define     URL_GOODDRAMA  [URL_SERVERADDRESS stringByAppendingString:@"/drama/good"]
//剧目详情
#define     URL_DETIAL  [URL_SERVERADDRESS stringByAppendingString:@"/drama/detail?did="]
//我的发布
#define     URL_MEPUBLISH  [URL_SERVERADDRESS stringByAppendingString:@"/drama/publishes"]
//发布剧集
#define     URL_PUBLISHDRAMA  [URL_SERVERADDRESS stringByAppendingString:@"/drama/publish"]
//我的收藏
#define     URL_COLLECTION  [URL_SERVERADDRESS stringByAppendingString:@"/user/collections"]
//系统消息
#define     URL_SYSYTEMMESSAGE  [URL_SERVERADDRESS stringByAppendingString:@"/system/messages"]
