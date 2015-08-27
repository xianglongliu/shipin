

#import "MyDrama.h"


@implementation MyDrama {

}
//主键
+(NSArray*) getPrimaryKeyUnionArray
{
    return @[@"id"];
}
//表名
+(NSString *)getTableName
{
    return @"t_publish";
}
@end