//
//  ExUINavigationBar.h
//  jifen
//
//  Created by jf.zhang on 13-9-18.
//  Copyright (c) 2013年 dlinkmac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExUINavigationBar : UINavigationBar<UINavigationBarDelegate>
{
    UINavigationBar *navigationBar;
}

-(id)initWithFrameRect:(CGRect)rect BGImage:(NSString *)image StrTitle:(NSString *)title ;

@end
