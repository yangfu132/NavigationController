//
//  TestFunctionOC.m
//  SwiftDemo
//
//  Created by FlutterRole on 2025/1/12.
//

#import "TestFunctionOC.h"

struct TestFunctionArea {
    double length;
    double breath;
};

@implementation TestFunctionOC
- (void) testMain {
    [self testFunc];
    [TestFunctionOC testClassFunction];
}

- (void) testFunc {
    [self testFuncDemoByNo1:1 no2:2];
    [self  testFuncDemoByFirst:1 no2:2];
}

- (void) testFuncDemoByNo1:(NSInteger) no1 no2:(NSInteger)no2 {
    self.testCount = no1 + no2;
}

- (void) testFuncDemoByFirst:(NSInteger) no1 no2:(NSInteger)no2 {
    
}

+ (void) testClassFunction {
    NSLog(@"class function");
}

@end
