//
//  OCObjectDemo.m
//  SwiftCrashDemo
//
//  Created by yangfl on 2025/2/28.
//

#import "OCObjectDemo.h"
#import "OCCrashDemo.h"

@implementation OCObjectDemo
- (void) testMain {
    [self testCrash];
}

- (void) testCrash {
    OCCrashDemo* demo = [[OCCrashDemo alloc] init];
    [demo testMain];
}

@end
