

#import "MyCollection.h"


@implementation MyCollection {

}
//主键
+(NSArray*) getPrimaryKeyUnionArray
{
    return @[@"id"];
}
//表名
+(NSString *)getTableName
{
    return @"t_collection";
}
@end