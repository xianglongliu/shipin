//
//  Macroh
//  movikr
//
//  Created by Mapollo27 on 15/5/29.
//  Copyright (c) 2015年 movikr. All rights reserved.
//


#define iPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? (CGSizeEqualToSize(CGSizeMake(320, 640), [[UIScreen mainScreen] currentMode].size) || CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size)) : NO)

#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)

#define iPhone6plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? (CGSizeEqualToSize(CGSizeMake(1125, 2001), [[UIScreen mainScreen] currentMode].size) || CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size)) : NO)
//获取屏幕宽度
#define     SCREEN_WIDTH  [[UIScreen mainScreen] bounds].size.width
//获取屏幕高度
#define     SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height

#define     IS_IOS7                     [[[UIDevice currentDevice]systemVersion] floatValue] >= 7.0
#define     TABBAR_HEIGHT               (IS_IOS7?54:44)
#define     STATUSBAR_HEIGHT            (IS_IOS7?20:0)

#define     NOTIFITION_SELECTCURDATE                    @"notifition_date"
//颜色转换
#define     kUIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define RGB(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1]
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]

#define yellowRgb   RGB(239, 190, 0)
#define grayRgb   RGB(246, 246, 246)
#define FontSize    12

//返回按钮宽高

#define backButtonFram  CGRectMake(10, 25, 45, 22)

#define netWorkUrl @"http://f.hiphotos.baidu.com/image/pic/item/42166d224f4a20a4bb6d32c092529822720ed042.jpg"
//无网络加载默认图片
#define     DefaultImage                [UIImage imageNamed:@"picture_default.png"]






