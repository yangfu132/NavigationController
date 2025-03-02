//
//  OCForwardingDemo.m
//  SwiftCrashDemo
//
//  Created by yangfl on 2025/2/28.
//

#import "OCForwardingDemo.h"
#import <objc/runtime.h>
#import "OCForwardingProtocol.h"
@implementation OCForwardingDemo

+ (void)load {
    
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.subDemo = [[OCSubForwardingDemo alloc] init];
    }
    return self;
}

- (void) testMain {
    
}

#pragma mark - resolve

+ (BOOL)resolveClassMethod:(SEL)sel {
    return NO;
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    if (sel == @selector(dynamicMethod)) {
        class_addMethod([self class], sel, (IMP)dynamicMethodImp, "v@:");
        return NO;
    }
#pragma clang diagnostic pop
    return [super resolveInstanceMethod:sel];
}

void dynamicMethodImp(id self, SEL _cmd) {
    NSLog(@"dynamicMethodImp");
}

#pragma mark - forwardingTargetForSelector

- (id)forwardingTargetForSelector:(SEL)aSelector {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    if (aSelector == @selector(dynamicForwardingTargetForSelector:)) {
#pragma clang diagnostic pop
        
#warning 不推荐new，推荐使用respondsToSelector
        return [OCSubForwardingDemo new];
        //如果写成return [OCForwardingDemo new];，内存会暴涨，而且会卡住；还是用respondsToSelector吧。
    } else if ([self.subDemo respondsToSelector:aSelector]) {
        return self.subDemo;
    } else {
        return [super forwardingTargetForSelector:aSelector];
    }
}

#pragma mark - methodSignatureForSelector

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    
    NSMethodSignature* signature = [super methodSignatureForSelector:aSelector];
    if (!signature) {
        if (aSelector == @selector(protocol_forwarding_method_name)) {
            Protocol *_protocol = @protocol(OCForwardingProtocol);
            struct objc_method_description methodDescription = protocol_getMethodDescription(_protocol, aSelector, NO, YES);
            if (methodDescription.name == NULL) {
                methodDescription = protocol_getMethodDescription(_protocol, aSelector, YES, YES);
                if (NULL == methodDescription.name) {
                    return [super methodSignatureForSelector:aSelector];
                }
            }
            return [NSMethodSignature signatureWithObjCTypes:methodDescription.types];
        } else if (aSelector == @selector(instance_forwarding_method_name)) {
            return [OCSubForwardingDemo instanceMethodSignatureForSelector:@selector(instance_forwarding_method_name)];
        } else {
            NSLog(@"methodSignatureForSelector:%@",NSStringFromSelector(aSelector));
            return [NSObject instanceMethodSignatureForSelector:@selector(init)];
            
        }
    }
    return signature;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    if (anInvocation.selector == @selector(protocol_forwarding_method_name)) {
        [self.subDemo protocol_forwarding_method_name];
    } else if (anInvocation.selector == @selector(instance_forwarding_method_name)) {
        [self.subDemo instance_forwarding_method_name];
    } else {
        anInvocation.target = self.subDemo;
        anInvocation.selector = @selector(handleUnrecognizedSelector);
        [anInvocation invoke];
    }
    NSLog(@"forwardInvocation");
}

@end
