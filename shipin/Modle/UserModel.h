
#import <Foundation/Foundation.h>
#import "JSONModel.h"


@interface UserModel : JSONModel

@property (nonatomic,strong) NSNumber<Optional> *id; //用户id
@property (nonatomic,strong) NSString<Optional> *name; //用户名称
@property (nonatomic,strong) NSString<Optional> *avatar; //用户头像
@property (nonatomic,strong) NSString<Optional> *brief; //简介
@property (nonatomic,strong) NSString<Optional> *corporation; //公司名称
@property (nonatomic,strong) NSString<Optional> *position; //职位
@property (nonatomic,strong) NSString<Optional> *mobile; //电话
@property (nonatomic,strong) NSString<Optional> *email; //邮箱
@property (nonatomic,strong) NSString<Optional> *createTime; //创建时间
@property (nonatomic,strong) NSString<Optional> *updateTime; //修改时间
@property (nonatomic,strong) NSNumber<Optional> *status; //状态  1未审核 2审核
@property (nonatomic,strong) NSData<Optional> *hImage; //上传头像
@property (nonatomic,strong) NSNumber<Optional> *toUid; //关注用户id

@end