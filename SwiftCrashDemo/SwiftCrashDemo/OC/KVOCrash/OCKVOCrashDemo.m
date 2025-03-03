//
//  OCKVOCrashDemo.m
//  SwiftCrashDemo
//
//  Created by yangfl on 2025/3/2.
//

#import "OCKVOCrashDemo.h"
#import "KVOCrashObject.h"
@implementation OCKVOCrashDemo
- (instancetype)init {
    self = [super init];
    if (self) {
        self.objc = [[KVOCrashObject alloc] init];
    }
    return self;
}

- (void) testMain {
    //    1.1 移除了未注册的观察者，导致崩溃
         [self testKVOCrash11];

    //    1.2 重复移除多次，移除次数多于添加次数，导致崩溃
    //    [self testKVOCrash12];

    //    1.3 重复添加多次，虽然不会崩溃，但是发生改变时，也同时会被观察多次。
    //    [self testKVOCrash13];

    //    2. 被观察者 dealloc 时仍然注册着 KVO，导致崩溃
    //    [self testKVOCrash2];

    //    3. 观察者没有实现 -observeValueForKeyPath:ofObject:change:context:导致崩溃
    //    [self testKVOCrash3];
        
    //    4. 添加或者移除时 keypath == nil，导致崩溃。
    //    [self testKVOCrash4];
}


/**
 1.1 移除了未注册的观察者，导致崩溃
 */
- (void)testKVOCrash11 {
    // 崩溃日志：Cannot remove an observer XXX for the key path "xxx" from XXX because it is not registered as an observer.
    [self.objc removeObserver:self forKeyPath:@"name"];
}

/**
 1.2 重复移除多次，移除次数多于添加次数，导致崩溃
 */
- (void)testKVOCrash12 {
    // 崩溃日志：Cannot remove an observer XXX for the key path "xxx" from XXX because it is not registered as an observer.
    [self.objc addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:NULL];
    self.objc.name = @"0";
    [self.objc removeObserver:self forKeyPath:@"name"];
    [self.objc removeObserver:self forKeyPath:@"name"];
}

/**
 1.3 重复添加多次，虽然不会崩溃，但是发生改变时，也同时会被观察多次。
 */
- (void)testKVOCrash13 {
    [self.objc addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:NULL];
    [self.objc addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:NULL];
    self.objc.name = @"0";
}

/**
 2. 被观察者 dealloc 时仍然注册着 KVO，导致崩溃
 */
- (void)testKVOCrash2 {
    // 崩溃日志：An instance xxx of class xxx was deallocated while key value observers were still registered with it.
    // iOS 10 及以下会导致崩溃，iOS 11 之后就不会崩溃了
    KVOCrashObject *obj = [[KVOCrashObject alloc] init];
    [obj addObserver: self
          forKeyPath: @"name"
             options: NSKeyValueObservingOptionNew
             context: nil];
}

/**
 3. 观察者没有实现 -observeValueForKeyPath:ofObject:change:context:导致崩溃
 */
- (void)testKVOCrash3 {
    // 崩溃日志：An -observeValueForKeyPath:ofObject:change:context: message was received but not handled.
    KVOCrashObject *obj = [[KVOCrashObject alloc] init];
    
    [self addObserver: obj
           forKeyPath: @"title"
              options: NSKeyValueObservingOptionNew
              context: nil];

    self.title = @"111";
}

/**
 4. 添加或者移除时 keypath == nil，导致崩溃。
 */
- (void)testKVOCrash4 {
    // 崩溃日志： -[__NSCFConstantString characterAtIndex:]: Range or index out of bounds
    KVOCrashObject *obj = [[KVOCrashObject alloc] init];
    
    [self addObserver: obj
           forKeyPath: @""
              options: NSKeyValueObservingOptionNew
              context: nil];
    
//    [self removeObserver:obj forKeyPath:@""];
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary*)change context:(void *)context {

    NSLog(@"object = %@, keyPath = %@", object, keyPath);
}

@end
