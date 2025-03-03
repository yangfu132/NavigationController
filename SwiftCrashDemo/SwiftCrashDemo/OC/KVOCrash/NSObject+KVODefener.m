//
//  NSObject+KVODefener.m
//  SwiftCrashDemo
//
//  Created by yangfl on 2025/3/2.
//

#import "NSObject+KVODefener.h"
#import "NSObject+Safe.h"
#import "YSCKVOProxy.h"
#import <objc/runtime.h>

// 判断是否是系统类
static inline BOOL IsSystemClass(Class cls){
    BOOL isSystem = NO;
    NSString *className = NSStringFromClass(cls);
    if ([className hasPrefix:@"NS"] || [className hasPrefix:@"__NS"] || [className hasPrefix:@"OS_xpc"]) {
        isSystem = YES;
        return isSystem;
    }
    NSBundle *mainBundle = [NSBundle bundleForClass:cls];
    if (mainBundle == [NSBundle mainBundle]) {
        isSystem = NO;
    }else{
        isSystem = YES;
    }
    return isSystem;
}

@implementation NSObject (KVODefener)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        // 拦截 `addObserver:forKeyPath:options:context:` 方法，替换自定义实现
        [NSObject safeDefenderSwizzlingClassMethod: @selector(addObserver:forKeyPath:options:context:)
                                          withMethod: @selector(ysc_addObserver:forKeyPath:options:context:)
                                           withClass: [NSObject class]];
        
        // 拦截 `removeObserver:forKeyPath:` 方法，替换自定义实现
        [NSObject safeDefenderSwizzlingClassMethod: @selector(removeObserver:forKeyPath:)
                                          withMethod: @selector(ysc_removeObserver:forKeyPath:)
                                           withClass: [NSObject class]];
        
        // 拦截 `removeObserver:forKeyPath:context:` 方法，替换自定义实现
        [NSObject safeDefenderSwizzlingClassMethod: @selector(removeObserver:forKeyPath:context:)
                                          withMethod: @selector(ysc_removeObserver:forKeyPath:context:)
                                           withClass: [NSObject class]];
        
        // 拦截 `dealloc` 方法，替换自定义实现
        [NSObject safeDefenderSwizzlingClassMethod: NSSelectorFromString(@"dealloc")
                                          withMethod: @selector(ysc_kvodealloc)
                                           withClass: [NSObject class]];
    });
}

static void *YSCKVOProxyKey = &YSCKVOProxyKey;
static NSString *const KVODefenderValue = @"YSC_KVODefender";
static void *KVODefenderKey = &KVODefenderKey;

// YSCKVOProxy setter 方法
- (void)setYscKVOProxy:(YSCKVOProxy *)yscKVOProxy {
    objc_setAssociatedObject(self, YSCKVOProxyKey, yscKVOProxy, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

// YSCKVOProxy getter 方法
- (YSCKVOProxy *)yscKVOProxy {
    id yscKVOProxy = objc_getAssociatedObject(self, YSCKVOProxyKey);
    if (yscKVOProxy == nil) {
        yscKVOProxy = [[YSCKVOProxy alloc] init];
        self.yscKVOProxy = yscKVOProxy;
    }
    return yscKVOProxy;
}

// 自定义 addObserver:forKeyPath:options:context: 实现方法
- (void)ysc_addObserver:(NSObject *)observer
             forKeyPath:(NSString *)keyPath
                options:(NSKeyValueObservingOptions)options
                context:(void *)context {
    
    if (!IsSystemClass(self.class)) {
        objc_setAssociatedObject(self, KVODefenderKey, KVODefenderValue, OBJC_ASSOCIATION_RETAIN);
        if ([self.yscKVOProxy addInfoToMapWithObserver:observer forKeyPath:keyPath options:options context:context]) {
            // 如果添加 KVO 信息操作成功，则调用系统添加方法
            [self ysc_addObserver:self.yscKVOProxy forKeyPath:keyPath options:options context:context];
        } else {
            // 添加 KVO 信息操作失败：说明之前添加过，这一次是重复添加，无需添加操作。
            NSString *className = (NSStringFromClass(self.class) == nil) ? @"" : NSStringFromClass(self.class);
            NSString *reason = [NSString stringWithFormat:@"KVO Warning : Repeated additions to the observer:%@ for the key path:'%@' from %@",
                                observer, keyPath, className];
            NSLog(@"%@",reason);
        }
    } else {
        [self ysc_addObserver:observer forKeyPath:keyPath options:options context:context];
    }
}

// 自定义 removeObserver:forKeyPath:context: 实现方法
- (void)ysc_removeObserver:(NSObject *)observer
                forKeyPath:(NSString *)keyPath
                   context:(void *)context {
    
    if (!IsSystemClass(self.class)) {
        if ([self.yscKVOProxy removeInfoInMapWithObserver:observer forKeyPath:keyPath context:context]) {
            // 如果移除 KVO 信息操作成功，则调用系统移除方法
            [self ysc_removeObserver:self.yscKVOProxy forKeyPath:keyPath context:context];
        } else {
            // 移除 KVO 信息操作失败：移除了未注册的观察者
            NSString *className = NSStringFromClass(self.class) == nil ? @"" : NSStringFromClass(self.class);
            NSString *reason = [NSString stringWithFormat:@"KVO Warning : Cannot remove an observer %@ for the key path '%@' from %@ , because it is not registered as an observer", observer, keyPath, className];
            NSLog(@"%@",reason);
        }
    } else {
        [self ysc_removeObserver:observer forKeyPath:keyPath context:context];
    }
}

// 自定义 removeObserver:forKeyPath: 实现方法
- (void)ysc_removeObserver:(NSObject *)observer
                forKeyPath:(NSString *)keyPath {
    
    if (!IsSystemClass(self.class)) {
        if ([self.yscKVOProxy removeInfoInMapWithObserver:observer forKeyPath:keyPath]) {
            // 如果移除 KVO 信息操作成功，则调用系统移除方法
            [self ysc_removeObserver:self.yscKVOProxy forKeyPath:keyPath];
        } else {
            // 移除 KVO 信息操作失败：移除了未注册的观察者
            NSString *className = NSStringFromClass(self.class) == nil ? @"" : NSStringFromClass(self.class);
            NSString *reason = [NSString stringWithFormat:@"KVO Warning : Cannot remove an observer %@ for the key path '%@' from %@ , because it is not registered as an observer", observer, keyPath, className];
            NSLog(@"%@",reason);
        }
    } else {
        [self ysc_removeObserver:observer forKeyPath:keyPath];
    }
    
}

// 自定义 dealloc 实现方法
- (void)ysc_kvodealloc {
    @autoreleasepool {
        if (!IsSystemClass(self.class)) {
            NSString *value = (NSString *)objc_getAssociatedObject(self, KVODefenderKey);
            if ([value isEqualToString:KVODefenderValue]) {
                NSArray *keyPaths =  [self.yscKVOProxy getAllKeyPaths];
                // 被观察者在 dealloc 时仍然注册着 KVO
                if (keyPaths.count > 0) {
                    NSString *reason = [NSString stringWithFormat:@"KVO Warning : An instance %@ was deallocated while key value observers were still registered with it. The Keypaths is:'%@'", self, [keyPaths componentsJoinedByString:@","]];
                    NSLog(@"%@",reason);
                }
                
                // 移除多余的观察者
                for (NSString *keyPath in keyPaths) {
                    [self ysc_removeObserver:self.yscKVOProxy forKeyPath:keyPath];
                }
            }
        }
    }
    
    
    [self ysc_kvodealloc];
}

@end
