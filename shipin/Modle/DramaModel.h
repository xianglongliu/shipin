
#import <Foundation/Foundation.h>

@class DramaOpModel;


@protocol DramaPostersModel;

@protocol ScreenShotsModel;

@protocol SimilaritiesModel;

@protocol DramaRelativesModel;

@interface DramaModel : JSONModel

@property (nonatomic,strong) NSNumber<Optional> *id; //剧目id
@property (nonatomic,strong) NSNumber<Optional> *uid; //用户id
@property (nonatomic,strong) NSString<Optional> *username; //用户名称
@property (nonatomic,strong) NSString<Optional> *avatar; //用户头像
@property (nonatomic,strong) NSString<Optional> *name; //剧目名称
@property (nonatomic,strong) NSString<Optional> *brief; //简介
@property (nonatomic,strong) NSArray<Optional,DramaPostersModel>* posters; //封面图集（view中只取第一张）
@property (nonatomic,strong) NSNumber<Optional> *type; //类型
@property (nonatomic,strong) NSString<Optional> *recommend; //推荐语
@property (nonatomic,strong) DramaOpModel<Optional> *dramaOp; //阅读和关注数量
@property (nonatomic,strong) NSArray<Optional,ScreenShotsModel> *screenShots; //图集
@property (nonatomic,strong) NSString<Optional> *trailerUrl; //预告片地址
@property (nonatomic,strong) NSString<Optional> *director; //导演
@property (nonatomic,strong) NSString<Optional> *staring; //主演
@property (nonatomic,strong) NSString<Optional> *district; //地区
@property (nonatomic,strong) NSString<Optional> *language; //语言
@property (nonatomic,strong) NSString<Optional> *premiere; //首播时间

@property (nonatomic,strong) NSString<Optional> *distribution; //发行
@property (nonatomic,strong) NSString<Optional> *present; //出品
@property (nonatomic,strong) NSString<Optional> *boot; //开机时间
@property (nonatomic,strong) NSString<Optional> *wrap; //杀青时间
@property (nonatomic,strong) NSString<Optional> *episodes; //集数
@property (nonatomic,strong) NSArray<Optional,SimilaritiesModel> *similarities; //相似剧集
@property (nonatomic,strong) NSArray<Optional,DramaRelativesModel> *dramaRelatives; //相关资料
@property (nonatomic,strong) NSNumber<Optional> *status; //状态  1未审核 2审核

@end


//相关操作
@interface DramaOpModel : JSONModel

@property (nonatomic,strong) NSNumber<Optional> *did;
@property (nonatomic,strong) NSString<Optional> *createTime; //创建时间
@property (nonatomic,strong) NSString<Optional> *updateTime; //修改时间
@property (nonatomic,strong) NSNumber<Optional> *collects; //关注数
@property (nonatomic,strong) NSNumber<Optional> *clicks; //阅读数

@end












