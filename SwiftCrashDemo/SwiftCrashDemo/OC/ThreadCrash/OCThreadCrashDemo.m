//
//  OCThreadCrashDemo.m
//  SwiftCrashDemo
//
//  Created by yangfl on 2025/3/3.
//

#import "OCThreadCrashDemo.h"
#import <pthread.h>
static void *mainQueueKey = "mainQueueKey";
static void *mainQueueValue = "mainQueueValue";

///----------------------3.8 Start -----------------------------------------------

#define dispatch_main_sync_safe_380(block)\
    if ([NSThread isMainThread]) {\
        block();\
    } else {\
        dispatch_sync(dispatch_get_main_queue(), block);\
    }

#define dispatch_main_async_safe_380(block)\
    if ([NSThread isMainThread]) {\
        block();\
    } else {\
        dispatch_async(dispatch_get_main_queue(), block);\
    }

///----------------------3.8 End -----------------------------------------------

///----------------------4.4.2 Start -----------------------------------------------
#ifndef dispatch_queue_async_safe_442
#define dispatch_queue_async_safe_442(queue, block)\
    if (dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL) == dispatch_queue_get_label(queue)) {\
        block();\
    } else {\
        dispatch_async(queue, block);\
    }
#endif

#ifndef dispatch_main_async_safe_442
#define dispatch_main_async_safe_442(block) dispatch_queue_async_safe_442(dispatch_get_main_queue(), block)
#endif

///----------------------4.2 End -----------------------------------------------
@implementation OCThreadCrashDemo {
    dispatch_queue_t _calQueue;
}

- (void) testMain {
    _calQueue = dispatch_queue_create("CalculateAlreadgoQueue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_queue_set_specific(dispatch_get_main_queue(), mainQueueKey, mainQueueValue, NULL);
    [self testSpecific];
    [self testMainQueue];
    [self testMainThread];
    [self testQueueLabel];
}

- (void) testMainThread {
    pthread_main_np();
    [NSThread isMainThread];
    if (mainQueueValue == dispatch_get_specific(mainQueueKey)) {
        NSLog(@"mainQueueKey:%s",(char*)mainQueueValue);
    }
}

- (void) testSpecific {
    dispatch_sync(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"main thread:%d", [NSThread isMainThread]);
        void *value = dispatch_get_specific(mainQueueKey);
        NSLog(@"main queue:%d", value != NULL);
    });
}

- (void) testMainQueue {
    //异步加入到全局并发队列中
    dispatch_async(_calQueue, ^{
        NSLog(@"main thread: %d", [NSThread isMainThread]);
        //异步加入到主队列中
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"main thread: %d", [NSThread isMainThread]);
            NSLog(@"%@",[NSThread currentThread]);
            // 判断是否是主队列
            void *value = dispatch_get_specific(mainQueueKey);//返回与当前分派队列关联的键的值。
            NSLog(@"main queue: %d", value != NULL);
        });
    });
//    NSLog(@"dispatch_main会堵塞主线程");
//    dispatch_main();
//    NSLog(@"查看是否堵塞主线程");
}

- (void) testQueueLabel {
    //获取主队列名
    const char *main_queue_name = dispatch_queue_get_label(dispatch_get_main_queue());
    const char *other_queue_name = "other_queue_name";
    NSLog(@"\nmain_queue_name====%s", main_queue_name);

    //创建一个和主队列名字一样的串行队列
    dispatch_queue_t customSerialQueue = dispatch_queue_create(other_queue_name, DISPATCH_QUEUE_SERIAL);

    if (strcmp(dispatch_queue_get_label(customSerialQueue), dispatch_queue_get_label(dispatch_get_main_queue())) == 0) {
        //名字一样
        NSLog(@"\ncutomSerialQueue is main queue");
        dispatch_async(customSerialQueue, ^{
            //将更新UI的操作放到这个队列
            if ([NSThread isMainThread]) {
                NSLog(@"i am mainThread ");
            }
      
            NSLog(@"\nUI Action Finished");
        });
        
    } else {
        //名字不一样
        NSLog(@"cutomSerialQueue is main queue");
        NSLog(@"main thread: %d", [NSThread isMainThread]);
        // 判断是否是主队列
        void *value = dispatch_get_specific(mainQueueKey);//返回与当前分派队列关联的键的值。
        NSLog(@"main queue: %d", value != NULL);
    }
}
@end
