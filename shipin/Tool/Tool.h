//
//  Tool.h
//  shipin
//
//  Created by Mapollo27 on 15/7/25.
//  Copyright (c) 2015年 dust.zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FVCustomAlertView.h"

@interface Tool : NSObject


+(void) showWarningTip:(NSString *) message view:(UIView*)view time:(float) delayTime;
///成功提示
+(void) showSuccessTip:(NSString *) message view:(UIView*)view time:(float) delayTime;
//设置uilable行高
+(void) setLabelSpacing:(UILabel*)label spacing:(float)spacing alignment:(NSTextAlignment)alignment;
//拼接图片url
+(NSURL *) stringMerge:(NSString *)imageUrl;

@end
