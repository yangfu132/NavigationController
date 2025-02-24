//
//  TestProperty.m
//  SwiftDemo
//
//  Created by FlutterRole on 2025/2/11.
//

#import "TestProperty.h"
#import <objc/runtime.h>

//
//void dispatch_once_f(dispatch_once_t *val, void *ctxt, dispatch_function_t func) {
//
//    struct _dispatch_once_waiter_s * volatile *vval =(struct _dispatch_once_waiter_s**)val;
//    struct _dispatch_once_waiter_s dow = { NULL, 0 };
//    struct _dispatch_once_waiter_s *tail, *tmp;
//    _dispatch_thread_semaphore_t sema;
//    if (dispatch_atomic_cmpxchg(vval, NULL, &dow, acquire)) {
//        _dispatch_client_callout(ctxt, func);
//        dispatch_atomic_maximally_synchronizing_barrier();// above assumed to contain release barrier
//        tmp = dispatch_atomic_xchg(vval, DISPATCH_ONCE_DONE, relaxed);
//        tail = &dow;
//        while (tail != tmp) {
//            while (!tmp->dow_next) {
//                dispatch_hardware_pause();
//            }
//            sema = tmp->dow_sema;
//            tmp = (struct _dispatch_once_waiter_s*)tmp->dow_next;
//            _dispatch_thread_semaphore_signal(sema);
//        }
//
//    } else {
//        dow.dow_sema = _dispatch_get_thread_semaphore();
//        tmp = *vval;
//        for (;;) {
//            if (tmp == DISPATCH_ONCE_DONE) {break;}
//            if (dispatch_atomic_cmpxchgvw(vval, tmp, &dow, &tmp, release)) {
//                dow.dow_next = tmp;
//                _dispatch_thread_semaphore_wait(dow.dow_sema);
//                break;
//            }
//        }
//        _dispatch_put_thread_semaphore(dow.dow_sema);
//
//    }
//
//}

@implementation TestProperty
- (void) testMain {
//    [self willChangeValueForKey:@"propertyVar"];
//    id idDemo = @"aaa";
//    NSString* strDemo = @"aaa";
//    [strDemo stringByAppendingString:@"bbb"];
//    [idDemo stringByAppendingString:@"bbb"];
//    NSLog(@"%@",idDemo);
//    
//    NSObject* ocDemo = @"aaa";
//    [ocDemo stringByAppendingString:@"bbb"];
//    NSLog(@"%@",ocDemo);
//    [NSNull null];
}

- (Class)class {
    return class_getSuperclass(object_getClass(self));
    return [NSObject class];
}


@end
