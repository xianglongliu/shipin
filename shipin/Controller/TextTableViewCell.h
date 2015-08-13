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

@property (nonatomic ,strong) UILabel *leftLable;
@property (nonatomic ,strong) UILabel *rightLable;


-(void) setLableText:(TextModel*)tModle;


@end
