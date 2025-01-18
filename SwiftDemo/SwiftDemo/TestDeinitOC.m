//
//  TestDeinitOC.m
//  SwiftDemo
//
//  Created by FlutterRole on 2025/1/15.
//

#import "TestDeinitOC.h"

NSInteger count = 0;
@interface BaseClass : NSObject

@end

@implementation BaseClass


- (instancetype)init {
    self = [super init];
    if (self) {
        count += 1;
    }
    return self;
}

- (void)dealloc {
    count -= 1;
}
@end


@implementation TestDeinitOC

- (void) testMain {
    [self testDeinit];
}

- (void) testDeinit {
    BaseClass* show = [[BaseClass alloc] init];
    NSLog(@"%ld",count);
    
    show = nil;
    NSLog(@"%ld",count);
}

@end
