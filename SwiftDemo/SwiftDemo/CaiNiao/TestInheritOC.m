//
//  TestInheritOC.m
//  SwiftDemo
//
//  Created by FlutterRole on 2025/1/14.
//

#import "TestInheritOC.h"

@interface StudDetails : NSObject


@end

@implementation StudDetails

- (void) inheritFunc {
    
}

- (void) overrideFunc {
    NSLog(@"super function");
}

- (void) noOverrideFunc {
    
}


@end

@interface Tom : StudDetails

@end

@implementation Tom
- (void) overrideFunc {
    NSLog(@"sub function");
}

@end

@implementation TestInheritOC
- (void) testMain {
    [self testInherit];
    [self testOverrideFunc];
    [self testOverrideProperty];
    [self testNoOverride];
}

- (void) testInherit {
    Tom* tom = [[Tom alloc] init];
    [tom inheritFunc];
}

- (void) testOverrideFunc {
    StudDetails* stud = [[StudDetails alloc] init];
    [stud overrideFunc];
    
    Tom* tom = [[Tom alloc] init];
    [tom overrideFunc];
}

- (void) testOverrideProperty {
    //重写属性:
    // 应该只能重写计算属性，但是我不想写这句代码了；

    //重写属性观察器
    // 重写方法即可
}

- (void) testNoOverride {
    ///没找到方法
}
@end
