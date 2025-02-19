//
//  TestExtensionCategoryOC.m
//  SwiftDemo
//
//  Created by FlutterRole on 2025/2/14.
//

#import "TestExtensionCategoryOC.h"
#import "TestCategoryOC.h"

@interface TestExtensionCategoryOC() {
    NSString* _demoString;
}
- (void) testExtension;
@end

@interface TestExtensionCategoryOC()
- (void) testExtensionTwo;
@end

@implementation TestExtensionCategoryOC

- (void) testMain {
    [self testCategory];
    [self testExtension];
    [self testExtensionTwo];
    [self testComputeVar];
}

- (void) testCategory {
    TestCategoryOC* demo = [[TestCategoryOC alloc] init];
    [demo printCaiNiao];
}

- (void) testExtension {
    NSLog(@"testExtension");
}

- (void) testExtensionTwo {
    NSLog(@"testExtensionTwo");
}

- (void) testComputeVar {
    TestCategoryOC* demo = [[TestCategoryOC alloc] init];
    NSLog(@"demo.demoArea:%f",demo.demoArea);
    demo.demoArea = 300;
    NSLog(@"demo.demoArea:%f",demo.demoArea);
}
@end
