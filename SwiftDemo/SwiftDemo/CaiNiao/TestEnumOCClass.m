//
//  TestEnumOCClass.m
//  SwiftDemo
//
//  Created by FlutterRole on 2024/11/28.
//

#import "TestEnumOCClass.h"

@implementation TestEnumOCClass
- (void) testEnum {
    [self testCreate];
    [self testRaw];
}

- (void) testCreate {
    enum DaysofaWeak {
        Sunday,
        Monday,
        Tuesday,
        Wedensday,
        Thursday,
        Friday,
        Saturday
    };
    
    enum DaysofaWeak weekDay = Sunday;
    switch (weekDay) {
        case Sunday:
            NSLog(@"星期天");
            break;
        case Monday:
            NSLog(@"星期一");
            break;
        case Tuesday:
            NSLog(@"星期二");
            break;
        case Wedensday:
            NSLog(@"星期三");
            break;
        case Thursday:
            NSLog(@"星期四");
            break;
        case Friday:
            NSLog(@"星期五");
            break;
        case Saturday:
            NSLog(@"星期六");
            break;
        default:
            NSLog(@"default error");
            break;
    }
    
    enum {
        up = 1 << 0,
        down = 1 << 1,
        left = 1 << 2,
        right = 1 << 3,
    } dirVar;
    
    dirVar = up;
}

- (void) testRaw {
    enum Month:NSUInteger {
        January = 1,
        February = 2,
        March = 5,
        November,
        December
    };

    enum Month yearMonth = March;
    NSLog(@"数字月份为: %ld。",(long)yearMonth);
}

- (void) testBinary {
    enum Direction {
        up = 1 << 0,
        down = 1 << 1,
        left = 1 << 2,
        right = 1 << 3,
    };
    enum Direction dirVar = up | down;
    NSLog(@"方向为: %ld。",(long)dirVar);
}


- (void) testTypeDefine {
    typedef enum Direction {
        up = 1 << 0,
        down = 1 << 1,
        left = 1 << 2,
        right = 1 << 3,
    } Enum_Direction;
    Enum_Direction dirVar = up | down;
    NSLog(@"方向为: %ld。",(long)dirVar);
}

- (void) testEnumMacro {
    typedef NS_ENUM(NSInteger,Enum_Weekday) {
        January = 1,
        February = 2,
        March = 5,
        November,
        December
    };
    Enum_Weekday weekVar = January;
    NSLog(@"weekday为: %ld。",(long)weekVar);
    
    typedef NS_OPTIONS(NSInteger,Option_Dirction) {
        up = 1 << 0,
        down = 1 << 1,
        left = 1 << 2,
        right = 1 << 3,
    };
    Option_Dirction dirVar = up | down;
    NSLog(@"方向为: %ld。",(long)dirVar);
}



@end

