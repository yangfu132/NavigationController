//
//  KVCCrashObject.h
//  SwiftCrashDemo
//
//  Created by yangfl on 2025/3/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KVCCrashObject : NSObject
@property (nonatomic,assign) NSInteger crash4Age;

/**
 1. key 不是对象的属性，造成崩溃
 */
- (void)testKVCCrash1;


/**
 2. keyPath 不正确，造成崩溃
 */
- (void)testKVCCrash2;

/**
 3. key 为 nil，造成崩溃
 */
- (void)testKVCCrash3;

/**
 4. value 为 nil，造成崩溃
 */
- (void)testKVCCrash4;


@end

NS_ASSUME_NONNULL_END
