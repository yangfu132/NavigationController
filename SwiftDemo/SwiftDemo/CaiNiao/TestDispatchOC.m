//
//  TestDispatchOC.m
//  SwiftDemo
//
//  Created by FlutterRole on 2025/2/11.
//

#import "TestDispatchOC.h"

@implementation TestDispatchOC
- (void) testMain {
    dispatch_queue_t queue = dispatch_queue_create("aaa", DISPATCH_QUEUE_SERIAL);
    dispatch_block_t block = ^{
        NSLog(@"aaaa");
    };
    dispatch_async(queue, block);
    dispatch_block_cancel(block);
}
@end
