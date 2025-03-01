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
- (void) testMain {
    
}

+ (BOOL)resolveClassMethod:(SEL)sel {
    return YES;
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    return YES;
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    return self;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
#if 0
    Protocol *_protocol = @protocol(OCForwardingProtocol);
    struct objc_method_description methodDescription = protocol_getMethodDescription(_protocol, aSelector, NO, YES);
    if (methodDescription.name == NULL) {
        methodDescription = protocol_getMethodDescription(_protocol, aSelector, YES, YES);
        if (NULL == methodDescription.name) {
            return [super methodSignatureForSelector:aSelector];
        }
    }
    return [NSMethodSignature signatureWithObjCTypes:methodDescription.types];
#else
    return [NSObject instanceMethodSignatureForSelector:@selector(init)];
#endif
    
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    NSLog(@"forwardInvocation");
}
@end
