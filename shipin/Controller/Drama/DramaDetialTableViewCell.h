//
//  DramaDetialTableViewCell.h
//  shipin
//
//  Created by Mapollo27 on 15/8/16.
//  Copyright (c) 2015年 dust.zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DramaModel.h"
#import "DramaRelativesModel.h"
#import "SimilaritiesModel.h"
#import "DramaPostersModel.h"

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
//    相似剧集
//    UILabel     *_labelXsjj;
//    
//    UIImageView *_imageViewLeft;
//    UILabel     *_labelFilmNameLeft;
//    
//    UIImageView *_imageViewCenter;
//    UILabel     *_labelFilmNameCenter;
//    
//    UIImageView *_imageViewRight;
//    UILabel     *_labelFilmNameRight;
    
//    相关资料
    UILabel     *_labelTitle;
    UILabel     *_labelContent;
    UILabel     *_labelLine;
//    相似剧集
//    SimilaritiesModel *similaritiesItem;
    
    DramaPostersModel   *dramaPosters;//发布的图片
    DramaModel          *_dramaModel;
    
}
@property (nonatomic ,strong) UILabel       *_labelText;
@property (nonatomic ,strong) UIImageView   *_imageView;


-(void)setIntroductionText:(NSString*)text  headImage:(NSURL*)imageUrl imageHeight:(float)height;
-(void)setProjectInfo:(DramaModel*)dramaModel;
//相似剧集
//-(void)setSimilarDrama:(NSMutableArray*)smilaritiesModelArray Parent:(NSString *)parent;

-(void)setRelatedData:(DramaRelativesModel*)dramaModel;

//初始化cell类
-(id)initWithReuseIdentifier:(NSString*)reuseIdentifier;


@end
