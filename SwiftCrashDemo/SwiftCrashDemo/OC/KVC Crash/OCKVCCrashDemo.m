//
//  OCKVCCrashDemo.m
//  SwiftCrashDemo
//
//  Created by yangfl on 2025/3/2.
//

/**
 KVC常见的崩溃原因：
 key 不是对象的属性，造成崩溃；
 keyPath 不正确，造成崩溃；
 key 为 nil，造成崩溃；
 value 为 nil，为非对象设值，造成崩溃；
 
 方法：
 重写setValue: forUndefinedKey:方法和valueForUndefinedKey: 方法；
 key为nil导致的问题，只需要交换系统的setValue:forKey:方法；
 value 为 nil导致的问题，需要重写系统的setNilValueForKey:方法

 作者：周糖果
 链接：https://juejin.cn/post/7077746745500762119
 来源：稀土掘金
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 */


#import "OCKVCCrashDemo.h"
#import "KVCCrashObject.h"

@implementation OCKVCCrashDemo
- (void) testMain {
    KVCCrashObject* kvcDemo = [[KVCCrashObject alloc] init];
    [kvcDemo testKVCCrash1];
    [kvcDemo testKVCCrash2];
    [kvcDemo testKVCCrash3];
    [kvcDemo testKVCCrash4];
    
}
@end
