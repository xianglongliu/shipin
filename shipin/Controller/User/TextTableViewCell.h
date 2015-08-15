//
//  TextTableViewCell.h
//  shipin
//
//  Created by Mapollo27 on 15/8/13.
//  Copyright (c) 2015年 dust.zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FilmModel.h"

@interface TextTableViewCell : UITableViewCell
{
    UILabel             *_lableLine;
    UIImageView         *_imageviewHead;
}
@property (nonatomic ,strong) UILabel *leftLable;
@property (nonatomic ,strong) UILabel *rightLable;


-(void) setLableText:(TextModel*)tModle viewName:(NSString *)viewname cellHegith:(float) hegith;



@end
