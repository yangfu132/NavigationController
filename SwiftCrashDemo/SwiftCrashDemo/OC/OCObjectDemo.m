//
//  OCObjectDemo.m
//  SwiftCrashDemo
//
//  Created by yangfl on 2025/2/28.
//

#import "OCObjectDemo.h"
#import "OCForwardingDemo.h"

@implementation OCObjectDemo
- (void) testMain {
    OCForwardingDemo* demo = [[OCForwardingDemo alloc] init];
    [demo testMain];
    
    id performDemo = demo;
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    [performDemo performSelector:@selector(forwarding_method_name)];
    [performDemo performSelector:@selector(dynamicMethod)];
    [performDemo performSelector:@selector(dynamicForwardingTargetForSelector:) withObject:@"From OCObjectDemo"];
    [performDemo performSelector:@selector(protocol_forwarding_method_name)];
    [performDemo performSelector:@selector(instance_forwarding_method_name)];
    [performDemo performSelector:@selector(forwarding_method_name_none)];
#pragma clang diagnostic pop
    
}


@end
