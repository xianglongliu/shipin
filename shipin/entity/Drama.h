

#import <Foundation/Foundation.h>

//全布据库
@interface Drama : NSObject
@property (nonatomic,strong) NSNumber *id; //剧目id
@property (nonatomic,strong) NSString *type; //类型1，发现
@property (nonatomic,strong) NSString *content; //json内容
@property (nonatomic,strong) NSNumber *uid; //用户id
@end