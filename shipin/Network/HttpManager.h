
#import <Foundation/Foundation.h>

#undef    DEF_SINGLETON
#define DEF_SINGLETON( __class ) \
+ (__class *)sharedInstance;

#undef    IMP_SINGLETON
#define IMP_SINGLETON( __class ) \
+ (__class *)sharedInstance \
{ \
static dispatch_once_t once; \
static __class * __singleton__; \
dispatch_once( &once, ^{ __singleton__ = [[__class alloc] init]; } ); \
return __singleton__; \
}


//服务器返回码
typedef enum SERVER_CODE {
    SUCCESS_CODE = 0, //成功
    ERROR_CODE_ONE = 1,//不明错误
    ERROR_CODE_101=101,//用户被屏蔽
    ERROR_CODE_102=102,//用户未登陆
    ERROR_CODE_103=103,//用户重复登陆
    ERROR_CODE_104=104,//登陆验证码错误
    ERROR_CODE_105=105 //token生成错误
} SERVER_CODE;

@class HttpProtocol;
@class AFHTTPRequestOperationManager;
@protocol AFURLRequestSerialization;
@class AFHTTPRequestSerializer;
@class AFHTTPRequestOperation;

/**
* 信息处理相关
*/
@protocol HttpManagerDataDelegate



//收到http协议实体
- (void)reciveHttpProtocol:(HttpProtocol *)httpData;

@end

@interface HttpManager : NSObject

DEF_SINGLETON(HttpManager)

@property (nonatomic, strong) dispatch_queue_t upProtolQueue;

@property(nonatomic,strong)NSMutableURLRequest* request;
@property(nonatomic,strong) AFHTTPRequestOperationManager *manager;
@property(nonatomic,strong) AFHTTPRequestSerializer <AFURLRequestSerialization> * requestSerializer;

//http请求
- (void )httpWithRequest:(HttpProtocol *)httpProtocol success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                                                            failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;
//http请求 添加使用
- (void )addHttpRequest:(HttpProtocol *)httpProtocol success:(void (^)(AFHTTPRequestOperation *operation, Boolean *boolean))success
                 failure:(void (^)(AFHTTPRequestOperation *operation, NSString *error))failure;

//图片处理
- (void )imageHttpRequest:(HttpProtocol *)httpProtocol imageData:(NSData *)imageData success:(void (^)(AFHTTPRequestOperation *operation, Boolean *boolean))success
                failure:(void (^)(AFHTTPRequestOperation *operation, NSString *error))failure;

@end