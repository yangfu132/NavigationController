//
//  OCKVCCrashDemo.m
//  SwiftCrashDemo
//
//  Created by yangfl on 2025/3/2.
//


#import "OCKVCCrashDemo.h"

@implementation OCKVCCrashDemo
- (void) testMain {
    [self testKVCCrash1];
    [self testKVCCrash2];
    [self testKVCCrash3];
    [self testKVCCrash4];   
}


/**
 1. key 不是对象的属性，造成崩溃
 */
- (void)testKVCCrash1 {
    // 崩溃日志：[<OCKVCCrashDemo 0x600000d48ee0> setValue:forUndefinedKey:]: this class is not key value coding-compliant for the key XXX.;
    
    OCKVCCrashDemo *objc = [[OCKVCCrashDemo alloc] init];
    [objc setValue:@"value" forKey:@"address"];
}

/**
 2. keyPath 不正确，造成崩溃
 */
- (void)testKVCCrash2 {
    // 崩溃日志：[<OCKVCCrashDemo 0x60000289afb0> valueForUndefinedKey:]: this class is not key value coding-compliant for the key XXX.
    
    OCKVCCrashDemo *objc = [[OCKVCCrashDemo alloc] init];
    [objc setValue:@"后厂村路" forKeyPath:@"address.street"];
}

/**
 3. key 为 nil，造成崩溃
 */
- (void)testKVCCrash3 {
    // 崩溃日志：'-[OCKVCCrashDemo setValue:forKey:]: attempt to set a value for a nil key

    NSString *keyName;
    // key 为 nil 会崩溃，如果传 nil 会提示警告，传空变量则不会提示警告
    
    OCKVCCrashDemo *objc = [[OCKVCCrashDemo alloc] init];
    [objc setValue:@"value" forKey:keyName];
}

/**
 4. value 为 nil，造成崩溃
 */
- (void)testKVCCrash4 {
    // 崩溃日志：[<OCKVCCrashDemo 0x6000028a6780> setNilValueForKey]: could not set nil as the value for the key XXX.
    
    // value 为 nil 会崩溃
    OCKVCCrashDemo *objc = [[OCKVCCrashDemo alloc] init];
    [objc setValue:nil forKey:@"crash4Age"];
}

@end
