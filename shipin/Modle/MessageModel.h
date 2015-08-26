

#import <Foundation/Foundation.h>


@interface MessageModel : JSONModel

@property (nonatomic,strong) NSNumber<Optional> *id; //id
@property (nonatomic,strong) NSString<Optional> *title; //消息内容
@property (nonatomic,strong) NSString<Optional> *msg; //消息内容
@property (nonatomic,strong) NSString<Optional> *createTime; //创建时间
@property (nonatomic,strong) NSString<Optional> *updateTime; //修改时间
@property (nonatomic,strong) NSNumber<Optional> *status; //状态  1:保存手机号码 2:未审核 3:审核通过 4:审核失败

@end