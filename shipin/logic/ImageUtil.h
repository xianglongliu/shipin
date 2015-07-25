//
//  ImageUtil.h
//  vjifen
//
//  Created by  on 13-10-8.
//  Copyright (c) 2013年 vjifen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage(ImageUtil)

- (UIImage *)scaleImageToSize:(UIImage *)img size:(CGSize)size;
- (UIImage*)imageByScalingAndCroppingForSize:(CGSize)targetSize;

@end
