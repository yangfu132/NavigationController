//
//  OCNSNullCrashDemo.m
//  SwiftCrashDemo
//
//  Created by yangfl on 2025/3/3.
//

#import "OCNSNullCrashDemo.h"

@implementation OCNSNullCrashDemo
- (void) testMain {
    NSNull* nullDemo = [NSNull new];
    [nullDemo copy];
}
@end
