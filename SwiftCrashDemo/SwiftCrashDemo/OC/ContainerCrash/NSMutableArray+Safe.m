//
//  NSMutableArray+Safe.m
//  SwiftCrashDemo
//
//  Created by yangfl on 2025/2/28.
//
//
//作者：周糖果
//链接：https://juejin.cn/post/7077746745500762119
//来源：稀土掘金
//著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。

#import "NSMutableArray+Safe.h"
#import "NSObject+Safe.h"
#import <objc/runtime.h>

@implementation NSMutableArray(Safe)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{

        //替换 objectAtIndex:
        NSString *tmpGetStr = @"objectAtIndex:";
        NSString *tmpSafeGetStr = @"safeMutable_objectAtIndex:";
        [NSObject exchangeInstanceMethodWithSelfClass:NSClassFromString(@"__NSArrayM")
                                     originalSelector:NSSelectorFromString(tmpGetStr)
                                     swizzledSelector:NSSelectorFromString(tmpSafeGetStr)];

        //替换 removeObjectsInRange:
        NSString *tmpRemoveStr = @"removeObjectsInRange:";
        NSString *tmpSafeRemoveStr = @"safeMutable_removeObjectsInRange:";
        [NSObject exchangeInstanceMethodWithSelfClass:NSClassFromString(@"__NSArrayM")
                                     originalSelector:NSSelectorFromString(tmpRemoveStr)
                                     swizzledSelector:NSSelectorFromString(tmpSafeRemoveStr)];

        //替换 insertObject:atIndex:
        NSString *tmpInsertStr = @"insertObject:atIndex:";
        NSString *tmpSafeInsertStr = @"safeMutable_insertObject:atIndex:";
        [NSObject exchangeInstanceMethodWithSelfClass:NSClassFromString(@"__NSArrayM")
                                     originalSelector:NSSelectorFromString(tmpInsertStr)
                                     swizzledSelector:NSSelectorFromString(tmpSafeInsertStr)];

        //替换 removeObject:inRange:
        NSString *tmpRemoveRangeStr = @"removeObject:inRange:";
        NSString *tmpSafeRemoveRangeStr = @"safeMutable_removeObject:inRange:";
        [NSObject exchangeInstanceMethodWithSelfClass:NSClassFromString(@"__NSArrayM")
                                     originalSelector:NSSelectorFromString(tmpRemoveRangeStr)
                                     swizzledSelector:NSSelectorFromString(tmpSafeRemoveRangeStr)];

        // 替换 objectAtIndexedSubscript
        NSString *tmpSubscriptStr = @"objectAtIndexedSubscript:";
        NSString *tmpSecondSubscriptStr = @"safeMutable_objectAtIndexedSubscript:";
        [NSObject exchangeInstanceMethodWithSelfClass:NSClassFromString(@"__NSArrayM")
                                     originalSelector:NSSelectorFromString(tmpSubscriptStr)
                                     swizzledSelector:NSSelectorFromString(tmpSecondSubscriptStr)];
    });
}

#pragma mark --- implement method

/**
 取出NSArray 第index个 值
  @param index 索引 index
  @return 返回值
 */
- (id)safeMutable_objectAtIndex:(NSUInteger)index {

    if (index >= self.count){
        return nil;
    }
    return [self safeMutable_objectAtIndex:index];
}

/**
 NSMutableArray 移除索引 index 对应的值
  @param range 移除范围
 */
- (void)safeMutable_removeObjectsInRange:(NSRange)range {
    if ((range.location + range.length) > self.count) {
        return;
    }

    return [self safeMutable_removeObjectsInRange:range];
}

/**
 在range范围内，移除掉anObject
  @param anObject 移除的anObject
  @param range 范围
 */

- (void)safeMutable_removeObject:(id)anObject inRange:(NSRange)range {
    if ((range.location + range.length) > self.count) {
        return;
    }

    if (!anObject){
        return;
    }

    return [self safeMutable_removeObject:anObject inRange:range];
}

/**
 NSMutableArray 插入 新值 到 索引index 指定位置
  @param anObject 新值
  @param index 索引 index
 */
- (void)safeMutable_insertObject:(id)anObject atIndex:(NSUInteger)index {
    if (index > self.count) {
        return;
    }

    if (!anObject){
        return;
    }

    [self safeMutable_insertObject:anObject atIndex:index];
}

/**
 取出NSArray 第index个 值 对应 __NSArrayI
  @param idx 索引 idx
  @return 返回值
 */

- (id)safeMutable_objectAtIndexedSubscript:(NSUInteger)idx {
    if (idx >= self.count){
        return nil;
    }

    return [self safeMutable_objectAtIndexedSubscript:idx];
}

@end
