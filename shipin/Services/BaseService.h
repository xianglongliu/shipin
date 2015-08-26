#import <Foundation/Foundation.h>

@interface BaseService : NSObject

{
    id multicastDelegate;
    dispatch_queue_t serviceQueue;
}


// 添加代理指定的queue
- (void)addDelegate:(id)delegate delegateQueue:(dispatch_queue_t)delegateQueue;

// 添加代理到dispatch_get_main_queue，即回调函数在主线程执行
- (void)addDelegate:(id)delegate;

// 清除指定的代理对象
- (void)removeDelegate:(id)delegate;

@end