//
//  TestClassOC.m
//  SwiftDemo
//
//  Created by FlutterRole on 2024/12/24.
//

#import "TestClassOC.h"

@interface SampleClass : NSObject
@property (nonatomic, copy) NSString* myProperty;
@end

@implementation SampleClass

- (instancetype) init:(NSString*)s {
    self = [super init];
    if (self) {
        self.myProperty = s;
    }
    return self;
}

- (BOOL) isEqualSample:(id)object {
    BOOL bResult = NO;
    if ([object isKindOfClass:[self class]]) {
        typeof(self) newObject = object;
        bResult = [self.myProperty isEqualToString:newObject.myProperty];
    }
    return bResult;
}

@end

@implementation TestClassOC

- (void) testClassOC {
    [self testEqual];
}

- (void) testEqual {
    SampleClass* spClass1 = [[SampleClass alloc] init:@"Hello"];
    SampleClass* spClass2 = [[SampleClass alloc] init:@"Hello"];
    if ([spClass1 isEqualSample:spClass2]) {
        NSLog(@"相等%@",spClass1.myProperty);
    }
    
    //总结：isEqual比较的是hash返回的值，而==只是简单的内存地址比较，大部份情况==为YES的，isEqual也为YES，如果isEqual为YES的不一定==也为YES。
    //实际上NSObject 的 isEqual就是 ==
    if (spClass1 == spClass2) {
        NSLog(@"引用相同的类实例 %@",spClass1);
    }
    
    if (spClass1 != spClass2) {
        NSLog(@"引用不相同的类实例 %@",spClass2);
    }
}

- (void) testRuntimeType {
    SampleClass* spClass1 = [[SampleClass alloc] init:@"Hello"];
    NSLog(@"runtimeType %@",spClass1.class);
}

@end
