//
//  DramaDetialTableViewCell.m
//  shipin
//
//  Created by Mapollo27 on 15/8/16.
//  Copyright (c) 2015年 dust.zhang. All rights reserved.
//

#import "DramaDetialTableViewCell.h"


@implementation DramaDetialTableViewCell

-(id)initWithReuseIdentifier:(NSString*)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self initLayuot];
    }
    return self;
}

- (void)initLayuot
{
    //图片
    self._imageView = [[UIImageView alloc ] initWithFrame:CGRectZero];
    self._imageView.layer.masksToBounds = YES;
    [self._imageView setContentMode:UIViewContentModeScaleAspectFill];
    [self addSubview:self._imageView];
    
    //内容
    self._labelText = [[UILabel alloc ] initWithFrame:CGRectZero];
    [self._labelText setTextColor:RGB(153, 153,153) ];
    //设置label的最大行数
    self._labelText.numberOfLines = 0;
    [self._labelText setLineBreakMode:NSLineBreakByCharWrapping];
    [self._labelText setFont:[ UIFont systemFontOfSize:FontSize]];
    [self addSubview:self._labelText];
    
//    导演
    _labelDir = [[UILabel alloc ] initWithFrame:CGRectZero];
    [_labelDir setText:@"导演:"];
    [_labelDir setBackgroundColor:[UIColor clearColor]];
    [_labelDir setFont:[UIFont boldSystemFontOfSize:13]];
    [self addSubview:_labelDir];
    
    _labelDirectorName = [[UILabel alloc ] initWithFrame:CGRectZero];
    [_labelDirectorName setBackgroundColor:[UIColor clearColor]];
    [_labelDirectorName setFont:[UIFont systemFontOfSize:13]];
    [_labelDirectorName setTextColor:RGB(102, 102, 102)];
    [self addSubview:_labelDirectorName];
    
    //    主演
    _labelZy = [[UILabel alloc ] initWithFrame:CGRectZero];
    [_labelZy setText:@"主演:"];
    [_labelZy setBackgroundColor:[UIColor clearColor]];
    [_labelZy setFont:[UIFont boldSystemFontOfSize:13]];
    [self addSubview:_labelZy];
    
    _labelZyName = [[UILabel alloc ] initWithFrame:CGRectZero];
    [_labelZyName setBackgroundColor:[UIColor clearColor]];
    [_labelZyName setFont:[UIFont systemFontOfSize:13]];
    [_labelZyName setTextColor:RGB(102, 102, 102)];
    [self addSubview:_labelZyName];
    
    //    地区
    _labelPlace = [[UILabel alloc ] initWithFrame:CGRectZero];
    [_labelPlace setText:@"地区:"];
    [_labelPlace setBackgroundColor:[UIColor clearColor]];
    [_labelPlace setFont:[UIFont boldSystemFontOfSize:13]];
    [self addSubview:_labelPlace];
    
    _labelPlaceName = [[UILabel alloc ] initWithFrame:CGRectZero];
    [_labelPlaceName setBackgroundColor:[UIColor clearColor]];
    [_labelPlaceName setFont:[UIFont systemFontOfSize:13]];
    [_labelPlaceName setTextColor:RGB(102, 102, 102)];
    [self addSubview:_labelPlaceName];
    
    //    语言
    _labelLang = [[UILabel alloc ] initWithFrame:CGRectZero];
    [_labelLang setText:@"语言:"];
    [_labelLang setBackgroundColor:[UIColor clearColor]];
    [_labelLang setFont:[UIFont boldSystemFontOfSize:13]];
    [self addSubview:_labelLang];
    
    _labelLangName = [[UILabel alloc ] initWithFrame:CGRectZero];
    [_labelLangName setBackgroundColor:[UIColor clearColor]];
    [_labelLangName setFont:[UIFont systemFontOfSize:13]];
    [_labelLangName setTextColor:RGB(102, 102, 102)];
    [self addSubview:_labelLangName];
    
    //    播放时间
    _labelPlayDate = [[UILabel alloc ] initWithFrame:CGRectZero];
    [_labelPlayDate setText:@"首播日期:"];
    [_labelPlayDate setBackgroundColor:[UIColor clearColor]];
    [_labelPlayDate setFont:[UIFont boldSystemFontOfSize:13]];
    [self addSubview:_labelPlayDate];
    
    _labelPlayDateName = [[UILabel alloc ] initWithFrame:CGRectZero];
    [_labelPlayDateName setBackgroundColor:[UIColor clearColor]];
    [_labelPlayDateName setFont:[UIFont systemFontOfSize:13]];
    [_labelPlayDateName setTextColor:RGB(102, 102, 102)];
    [self addSubview:_labelPlayDateName];
    
    _labelXsjj = [[UILabel alloc ] initWithFrame:CGRectZero];
    [_labelXsjj setBackgroundColor:[UIColor clearColor]];
    [_labelXsjj setFont:[UIFont boldSystemFontOfSize:13]];
    [_labelXsjj setTextColor:RGB(102, 102, 102)];
    [_labelXsjj setText:@"相似剧集"];
    [self addSubview:_labelXsjj];
//    相似剧集图片
    _imageViewLeft = [[UIImageView alloc ] initWithFrame:CGRectZero];
    _imageViewLeft.layer.masksToBounds = YES;
    [_imageViewLeft setContentMode:UIViewContentModeScaleAspectFill];
    [self addSubview:_imageViewLeft];
    
    _labelFilmNameLeft = [[UILabel alloc ] initWithFrame:CGRectZero];
    [_labelFilmNameLeft setBackgroundColor:[UIColor clearColor]];
    [_labelFilmNameLeft setFont:[UIFont boldSystemFontOfSize:10]];
    [_labelFilmNameLeft setTextColor:RGB(34, 34, 34)];
    [_labelFilmNameLeft setTextAlignment:NSTextAlignmentCenter];
    [self addSubview:_labelFilmNameLeft];
    
    _imageViewCenter = [[UIImageView alloc ] initWithFrame:CGRectZero];
    _imageViewCenter.layer.masksToBounds = YES;
    [_imageViewCenter setContentMode:UIViewContentModeScaleAspectFill];
    [self addSubview:_imageViewCenter];
    
    _labelFilmNameCenter = [[UILabel alloc ] initWithFrame:CGRectZero];
    [_labelFilmNameCenter setBackgroundColor:[UIColor clearColor]];
    [_labelFilmNameCenter setFont:[UIFont boldSystemFontOfSize:10]];
    [_labelFilmNameCenter setTextColor:RGB(34, 34, 34)];
    [_labelFilmNameCenter setTextAlignment:NSTextAlignmentCenter];
    [self addSubview:_labelFilmNameCenter];
    
    _imageViewRight = [[UIImageView alloc ] initWithFrame:CGRectZero];
    _imageViewRight.layer.masksToBounds = YES;
    [_imageViewRight setContentMode:UIViewContentModeScaleAspectFill];
    [self addSubview:_imageViewRight];
    
    _labelFilmNameRight = [[UILabel alloc ] initWithFrame:CGRectZero];
    [_labelFilmNameRight setBackgroundColor:[UIColor clearColor]];
    [_labelFilmNameRight setFont:[UIFont boldSystemFontOfSize:10]];
    [_labelFilmNameRight setTextColor:RGB(34, 34, 34)];
    [_labelFilmNameRight setTextAlignment:NSTextAlignmentCenter];
    [self addSubview:_labelFilmNameRight];
    
//    相关资料
    _labelTitle = [[UILabel alloc ] initWithFrame:CGRectZero];
    [_labelTitle setBackgroundColor:[UIColor clearColor]];
    [_labelTitle setFont:[UIFont systemFontOfSize:13]];
    [_labelTitle setTextColor:RGB(34, 34, 34)];
    [self addSubview:_labelTitle];

    _labelContent = [[UILabel alloc ] initWithFrame:CGRectZero];
    [_labelContent setBackgroundColor:[UIColor clearColor]];
    [_labelContent setFont:[UIFont systemFontOfSize:10]];
    [_labelContent setTextColor:RGB(153, 153, 153)];
    [self addSubview:_labelContent];
    
    _labelLine = [[UILabel alloc ] initWithFrame:CGRectZero];
    [_labelLine setBackgroundColor:RGB(221, 221, 221)];
    [self addSubview:_labelLine];


}

//剧情简介
-(void)setIntroductionText:(NSString*)text  headImage:(NSURL*)imageUrl imageHeight:(float)height
{   
    //获得当前cell高度
    CGRect frame = [self frame];
    //文本赋值
    self._labelText.text = text;
//    [Tool setLabelSpacing:self._labelText spacing:4 alignment:NSTextAlignmentLeft];
    float textHeight =[Tool CalcString:self._labelText.text fontSize:[UIFont systemFontOfSize:FontSize] andWidth:SCREEN_WIDTH-20].height;
    self._labelText.frame = CGRectMake(13, 0, SCREEN_WIDTH-26,textHeight+20 );
    self._imageView.frame = CGRectMake(13, 0, SCREEN_WIDTH-26,height );
    
    [self._imageView sd_setImageWithURL:imageUrl placeholderImage:DefaultImage];
    
    //计算出自适应的高度
    frame.size.height = textHeight+20 +height;
    
    self.frame = frame;
}

//电影信息
-(void)setProjectInfo:(DramaModel*)dramaModel
{
//    设置坐标
    _labelDir.frame  = CGRectMake(20, 20, 30, 18);
    _labelDirectorName.frame  = CGRectMake(60, 20, SCREEN_WIDTH, 18);
    
    _labelZy.frame  = CGRectMake(20, _labelDir.frame.origin.y+_labelDir.frame.size.height+10, 30, 18);
    _labelZyName.frame  = CGRectMake(60, _labelDir.frame.origin.y+_labelDir.frame.size.height+10, SCREEN_WIDTH, 18);
    
    _labelPlace.frame  = CGRectMake(20, _labelZyName.frame.origin.y+_labelZyName.frame.size.height+10, 30, 18);
    _labelPlaceName.frame  = CGRectMake(60, _labelZyName.frame.origin.y+_labelZyName.frame.size.height+10, SCREEN_WIDTH, 18);
    
    _labelLang.frame  = CGRectMake(20, _labelPlaceName.frame.origin.y+_labelPlaceName.frame.size.height+10, 30, 18);
    _labelLangName.frame  = CGRectMake(60, _labelPlaceName.frame.origin.y+_labelPlaceName.frame.size.height+10, SCREEN_WIDTH, 18);
    
    _labelPlayDate.frame  = CGRectMake(20, _labelLang.frame.origin.y+_labelLang.frame.size.height+10, 60, 18);
    _labelPlayDateName.frame  = CGRectMake(85, _labelLang.frame.origin.y+_labelLang.frame.size.height+10, SCREEN_WIDTH, 18);
    
    [_labelDirectorName setText:dramaModel.director];
    [_labelZyName setText:dramaModel.staring];
    [_labelPlaceName setText:dramaModel.district];
    [_labelLangName setText:dramaModel.language];
    [_labelPlayDateName setText:dramaModel.premiere];

}

//相似剧集
-(void)setSimilarDrama:(NSMutableArray*)smilaritiesModelArray;
{
    _labelXsjj.frame  = CGRectMake(20, 10, SCREEN_WIDTH/2, 18);

    _imageViewLeft.frame =CGRectMake(20, 45, (SCREEN_WIDTH-60)/3, ((SCREEN_WIDTH-60)/3) *1.5f);
    _labelFilmNameLeft.frame  = CGRectMake(_imageViewLeft.frame.origin.x, _imageViewLeft.frame.origin.y+_imageViewLeft.frame.size.height+5, _imageViewLeft.frame.size.width, 18);
    
    _imageViewCenter.frame =CGRectMake(_imageViewLeft.frame.origin.x+_imageViewLeft.frame.size.width+10, 45, _imageViewLeft.frame.size.width, _imageViewLeft.frame.size.height);
    _labelFilmNameCenter.frame  = CGRectMake(_imageViewCenter.frame.origin.x, _imageViewLeft.frame.origin.y+_imageViewLeft.frame.size.height+5,_labelFilmNameLeft.frame.size.width, _labelFilmNameLeft.frame.size.height);
    
    _imageViewRight.frame =CGRectMake(20, _imageViewCenter.frame.origin.x+_imageViewCenter.frame.size.width+10, _imageViewLeft.frame.size.width, _imageViewLeft.frame.size.height);
    _labelFilmNameRight.frame  = CGRectMake(_imageViewRight.frame.origin.x, _imageViewLeft.frame.origin.y+_imageViewLeft.frame.size.height+5, _labelFilmNameLeft.frame.size.width, _labelFilmNameLeft.frame.size.height);

    if ([smilaritiesModelArray count] >0)
    {
        similaritiesItem = [smilaritiesModelArray objectAtIndex:0];
        [_imageViewLeft sd_setImageWithURL:[Tool stringMerge:similaritiesItem.cover] placeholderImage:DefaultImage];
        [_labelFilmNameLeft setText:similaritiesItem.name];
    }
    if ([smilaritiesModelArray count] >1)
    {
        similaritiesItem = [smilaritiesModelArray objectAtIndex:1];
        [_imageViewCenter sd_setImageWithURL:[Tool stringMerge:similaritiesItem.cover] placeholderImage:DefaultImage];
        [_labelFilmNameCenter setText:similaritiesItem.name];
    }
    if ([smilaritiesModelArray count] >2)
    {
        similaritiesItem = [smilaritiesModelArray objectAtIndex:2];
        [_imageViewRight sd_setImageWithURL:[Tool stringMerge:similaritiesItem.cover] placeholderImage:DefaultImage];
        [_labelFilmNameRight setText:similaritiesItem.name];
    }

}

-(void)setRelatedData:(DramaRelativesModel*)dramaRelativesModel
{
    //    设置坐标
    _labelTitle.frame  = CGRectMake(20, 10, SCREEN_WIDTH-40, 15);
    _labelContent.frame  = CGRectMake(20, 30, SCREEN_WIDTH-40, 10);
    _labelLine.frame  = CGRectMake(0, _labelContent.frame.size.height+_labelContent.frame.origin.y+8, SCREEN_WIDTH, 1);
    
    [_labelTitle setText:dramaRelativesModel.text];
    [_labelContent setText:dramaRelativesModel.from];
}
@end
