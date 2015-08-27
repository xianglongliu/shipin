

#import "Drama.h"


@implementation Drama {

}

//主键
+(NSArray*) getPrimaryKeyUnionArray
{
    return @[@"id"];
}
//表名
+(NSString *)getTableName
{
    return @"t_drama";
}
@end