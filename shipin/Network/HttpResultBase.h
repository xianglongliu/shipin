
#import <Foundation/Foundation.h>

@interface HttpResultBase :NSObject {
}

//状态值
@property (nonatomic, assign) int code;
//数据内容
@property (nonatomic, strong) id data;

@end
