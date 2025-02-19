//
//  testMetaClass.m
//  SwiftDemo
//
//  Created by FlutterRole on 2025/2/15.
//

#import "testMetaClass.h"

@interface BFPerson : NSObject
@property (nonatomic, assign) int     age;
@property (nonatomic, copy) NSString *name;
@end

@implementation BFPerson

@end

//@interface testMetaClass : NSObject
//
//@end
//
//@interface testMetaClass : NSObject
//
//@end

@implementation testMetaClass
- (void) testMain {
    BFPerson* persion1 = [[BFPerson alloc] init];
    BFPerson* persion2 = [[BFPerson alloc] init];
}
@end
