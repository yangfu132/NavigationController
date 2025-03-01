//
//  NSArray+Safe.m
//  SwiftCrashDemo
//
//  Created by yangfl on 2025/2/28.
//
//
//作者：周糖果
//链接：https://juejin.cn/post/7077746745500762119
//来源：稀土掘金
//著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。

#import "NSArray+Safe.h"
#import "NSObject+Safe.h"
#import <objc/runtime.h>

@implementation NSArray(Safe)
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        //替换 objectAtIndex
        NSString *tmpStr = @"objectAtIndex:";
        NSString *tmpFirstStr = @"safe_ZeroObjectAtIndex:";
        NSString *tmpThreeStr = @"safe_objectAtIndex:";
        NSString *tmpSecondStr = @"safe_singleObjectAtIndex:";
        
        // 替换 objectAtIndexedSubscript
        NSString *tmpSubscriptStr = @"objectAtIndexedSubscript:";
        NSString *tmpSecondSubscriptStr = @"safe_objectAtIndexedSubscript:";
        
        [NSObject exchangeInstanceMethodWithSelfClass:NSClassFromString(@"__NSArray0")
                                     originalSelector:NSSelectorFromString(tmpStr)
                                     swizzledSelector:NSSelectorFromString(tmpFirstStr)];
        
        [NSObject exchangeInstanceMethodWithSelfClass:NSClassFromString(@"__NSSingleObjectArrayI")
                                     originalSelector:NSSelectorFromString(tmpStr)
                                     swizzledSelector:NSSelectorFromString(tmpSecondStr)];
        
        [NSObject exchangeInstanceMethodWithSelfClass:NSClassFromString(@"__NSArrayI")
                                     originalSelector:NSSelectorFromString(tmpStr)
                                     swizzledSelector:NSSelectorFromString(tmpThreeStr)];
    
        [NSObject exchangeInstanceMethodWithSelfClass:NSClassFromString(@"__NSArrayI")
                                     originalSelector:NSSelectorFromString(tmpSubscriptStr)
                                     swizzledSelector:NSSelectorFromString(tmpSecondSubscriptStr)];
    });
}

#pragma mark --- implement method

/**
 取出NSArray 第index个 值 对应 __NSArrayI
  @param index 索引 index
  @return 返回值
 */

- (id)safe_objectAtIndex:(NSUInteger)index {
    if (index >= self.count){
        return nil;
    }
    return [self safe_objectAtIndex:index];
}

/**
 取出NSArray 第index个 值 对应 __NSSingleObjectArrayI
  @param index 索引 index
  @return 返回值
 */
- (id)safe_singleObjectAtIndex:(NSUInteger)index {
    if (index >= self.count){
        return nil;
    }
    return [self safe_singleObjectAtIndex:index];
}

/**
 取出NSArray 第index个 值 对应 __NSArray0
  @param index 索引 index
  @return 返回值
 */
- (id)safe_ZeroObjectAtIndex:(NSUInteger)index {
    if (index >= self.count){
        return nil;
    }
    return [self safe_ZeroObjectAtIndex:index];
}

/**
 取出NSArray 第index个 值 对应 __NSArrayI
  @param idx 索引 idx
  @return 返回值
 */
- (id)safe_objectAtIndexedSubscript:(NSUInteger)idx {
    if (idx >= self.count){
        return nil;
    }
    return [self safe_objectAtIndexedSubscript:idx];
}

@end
