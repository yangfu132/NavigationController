//
//  TestAssociate.m
//  SwiftDemo
//
//  Created by FlutterRole on 2025/2/15.
//

#import "TestAssociate.h"
#import <objc/runtime.h>
#pragma mark - TestAssociateItem

@interface TestAssociateItem : NSObject

@end

@implementation TestAssociateItem
- (void) printRetainCount {
    
    NSLog(@"TestAssociateItem %ld",CFGetRetainCount((__bridge CFTypeRef)self));
}
@end

#pragma mark - TestAssociate

@implementation TestAssociate
- (void) testMain {
    TestAssociateItem* item = [[TestAssociateItem alloc] init];
    [item printRetainCount];
    
    objc_setAssociatedObject(self, @"associateItem", item, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    TestAssociateItem* getItem = objc_getAssociatedObject(self, @"associateItem");
    [getItem printRetainCount];
    
    objc_removeAssociatedObjects(self);
}
@end
