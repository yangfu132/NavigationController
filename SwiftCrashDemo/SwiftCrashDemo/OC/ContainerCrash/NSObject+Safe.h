//
//  NSObject+Safe.h
//  SwiftCrashDemo
//
//  Created by yangfl on 2025/2/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject(Safe)
/** 交换两个类方法的实现
   @param originalSelector 原始方法的 SEL
   @param swizzledSelector 交换方法的 SEL
   @param targetClass 类
 */
+ (void)safeDefenderSwizzlingClassMethod:(SEL)originalSelector withMethod:(SEL)swizzledSelector withClass:(Class)targetClass;

/** 交换两个对象方法的实现
     @param originalSelector 原始方法的 SEL
     @param swizzledSelector 交换方法的 SEL
     @param targetClass 类
 */
+ (void)safeDefenderSwizzlingInstanceMethod:(SEL)originalSelector withMethod:(SEL)swizzledSelector withClass:(Class)targetClass;

+ (void) exchangeInstanceMethodWithSelfClass:(Class)targetClass
                            originalSelector:(SEL)originalSelector
                            swizzledSelector:(SEL)swizzledSelector;
@end

NS_ASSUME_NONNULL_END
