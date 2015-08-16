//
//  DramaDetialTableViewCell.h
//  shipin
//
//  Created by Mapollo27 on 15/8/16.
//  Copyright (c) 2015年 dust.zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DramaModel.h"

@interface DramaDetialTableViewCell : UITableViewCell
{
    UILabel     *_labelDir;
    UILabel     *_labelDirectorName;
    UILabel     *_labelZy;
    UILabel     *_labelZyName;
    UILabel     *_labelPlace;
    UILabel     *_labelPlaceName;
    UILabel     *_labelLang;
    UILabel     *_labelLangName;
    UILabel     *_labelPlayDate;
    UILabel     *_labelPlayDateName;
    
}
@property (nonatomic ,strong) UILabel       *_labelText;
@property (nonatomic ,strong) UIImageView   *_imageView;


-(void)setIntroductionText:(NSString*)text  headImage:(NSURL*)imageUrl imageHeight:(float)height;

-(void)setIntroductionText:(DramaModel*)dramaModel;

//初始化cell类
-(id)initWithReuseIdentifier:(NSString*)reuseIdentifier;


@end
