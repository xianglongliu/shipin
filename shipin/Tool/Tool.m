//
//  Tool.m
//  shipin
//
//  Created by Mapollo27 on 15/7/25.
//  Copyright (c) 2015年 dust.zhang. All rights reserved.
//

#import "Tool.h"


@implementation Tool


+(void) showWarningTip:(NSString *) message view:(UIView*)view time:(float) delayTime
{
    [FVCustomAlertView showDefaultWarningAlertOnView:view withTitle:message withBlur:NO allowTap:YES];
    [self performSelector:@selector(autoAlertHide:) withObject:view afterDelay:delayTime];
}

+(void) showSuccessTip:(NSString *) message view:(UIView*)view time:(float) delayTime{
    [FVCustomAlertView showDefaultDoneAlertOnView:view withTitle:message withBlur:NO allowTap:YES];
    [self performSelector:@selector(autoAlertHide:) withObject:view afterDelay:delayTime];
}

/**
 *  弹出提示层
 *
 *  @param dTime 自动关闭时间
 */
+(void)autoAlertHide:(UIView*)view
{
    [FVCustomAlertView hideAlertFromView:view fading:YES];
}

@end
