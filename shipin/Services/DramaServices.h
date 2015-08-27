

#import <Foundation/Foundation.h>
#import "BaseService.h"
#import "HttpManager.h"

@interface DramaServices : BaseService

DEF_SINGLETON(DramaServices)

@property(nonatomic, strong) NSNumberFormatter* numberFormatter;

//获取发现频道数据，传指定页码
+(void) pullDramaGoodData:(int)pageNum success:(void (^)(NSArray * array))success
                                       failure:(void (^)( NSDictionary *error))failure;

//获取全部数据列表
+(void)pullAllDramaList:(int)pageNum success:(void (^)(NSArray * array))success
                                     failure:(void (^)( NSDictionary *error))failure;
//根据id获取剧目详情
+(void)getDramaDetail:(int)dId success:(void (^)(id dramaModel))success
                               failure:(void (^)( NSDictionary *error))failure;

//获取tag标签
+(void)getDramaTags;

@end