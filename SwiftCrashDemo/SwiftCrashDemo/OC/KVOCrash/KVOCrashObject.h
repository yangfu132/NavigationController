//
//  KVOCrashObject.h
//  SwiftCrashDemo
//
//  Created by yangfl on 2025/3/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 KVO 日常使用造成崩溃的原因通常有以下几个：

 1.KVO 添加次数和移除次数不匹配：

    1.1 移除了未注册的观察者，导致崩溃。
    1.2 重复移除多次，移除次数多于添加次数，导致崩溃。
    1.3 重复添加多次，虽然不会崩溃，但是发生改变时，也同时会被观察多次。


 2.被观察者提前被释放，被观察者在 dealloc 时仍然注册着 KVO，导致崩溃。
 例如：被观察者是局部变量的情况（iOS 10 及之前会崩溃）。
 3. 添加了观察者，但未实现 observeValueForKeyPath:ofObject:change:context: 方法，导致崩溃。
 4.添加或者移除时 keypath == nil，导致崩溃。
 
 方案0：https://github.com/facebookarchive/KVOController
 方案1：https://neyoufan.github.io/2017/01/13/ios/BayMax_HTSafetyGuard/
 方案2：https://github.com/ValiantCat/XXShield
 方案3：https://github.com/JackLee18/JKCrashProtect

 作者：ITCharge
 链接：https://juejin.cn/post/6844903927469588488
 来源：稀土掘金
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 */

@interface KVOCrashObject : NSObject
@property (nonatomic, copy) NSString *name;
@end

NS_ASSUME_NONNULL_END
