

#import "DramaDetail.h"


@implementation DramaDetail {

}
//主键
+(NSArray*) getPrimaryKeyUnionArray
{
    return @[@"id"];
}
//表名
+(NSString *)getTableName
{
    return @"t_drama_detail";
}
@end