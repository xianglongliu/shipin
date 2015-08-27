

#import "UserModel.h"


@implementation UserModel {

}

//主键
+(NSArray*) getPrimaryKeyUnionArray
{
    return @[@"id"];
}
//表名
+(NSString *)getTableName
{
    return @"t_user";
}
@end