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

+(void)autoAlertHide:(UIView*)view
{
    [FVCustomAlertView hideAlertFromView:view fading:YES];
}

+(void) setLabelSpacing:(UILabel*)label spacing:(float)spacing alignment:(NSTextAlignment)alignment
{
    if ([label.text length] <= 0 )
    {
        label.text = @"123";
    }
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:label.text];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:spacing];//调整行间距
    [paragraphStyle setAlignment:alignment];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [label.text length])];
    label.attributedText = attributedString;
    [label sizeToFit];
}

+(NSURL *) stringMerge:(NSString *)imageUrl
{
    return     [NSURL URLWithString:[[NSString stringWithFormat:@"%@",URL_SERVERURL] stringByAppendingString:imageUrl]];
}


/**
 @method 获取指定宽度情况ixa，字符串value的高度
 @param value 待计算的字符串
 @param fontSize 字体的大小
 @param andWidth 限制字符串显示区域的宽度
 @result float 返回的高度
 */
+ (CGSize) CalcString:(NSString *)value fontSize:(UIFont *)fontSize andWidth:(float)width
{
    CGSize sizeToFit =[self boundingRectWithSize:value
                                        textFont:fontSize
                                        textSize:CGSizeMake(width, CGFLOAT_MAX)];
    return sizeToFit;
}
+ (CGSize)boundingRectWithSize:(NSString *)text textFont:(UIFont *)font textSize:(CGSize)size
{
    NSDictionary *attribute = @{NSFontAttributeName: font};
    
    CGSize retSize = [text boundingRectWithSize:size
                                        options:\
                      NSStringDrawingTruncatesLastVisibleLine |
                      NSStringDrawingUsesLineFragmentOrigin |
                      NSStringDrawingUsesFontLeading
                                     attributes:attribute
                                        context:nil].size;
    
    return retSize;
}


@end
