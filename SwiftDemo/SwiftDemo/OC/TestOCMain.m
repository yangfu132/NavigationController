//
//  TestOCMain.m
//  SwiftDemo
//
//  Created by FlutterRole on 2025/2/11.
//

#import "TestOCMain.h"
#import "TestProperty.h"
#import "TestAssociate.h"

@implementation TestOCMain
- (void) testMain {
    [self aaa];
}

- (void) testAssociate {
    TestAssociate* demo = [[TestAssociate alloc] init];
    [demo testMain];
}

- (void) aaa {
    
    NSLog(@"1"); // 任务1
    dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        NSLog(@"2"); // 任务2
    });
    NSLog(@"3"); // 任务
}


- (void) bbb {
    NSLog(@"1"); // 任务1
    dispatch_sync(dispatch_get_main_queue(), ^{
        NSLog(@"2"); // 任务2
    });
    NSLog(@"3"); // 任务3
}
@end
