//
//  TestStructOC.m
//  SwiftDemo
//
//  Created by FlutterRole on 2024/12/20.
//



#import "TestStructOC.h"

@implementation TestStructOC
//func testCreate() {
//    struct MarkStruct {
//        var mark1:Int
//        var mark2:Int
//        var mark3:Int
//
//        init(mark1:Int,mark2:Int,mark3:Int) {
//            self.mark1 = mark1
//            self.mark2 = mark2
//            self.mark3 = mark3
//        }
//    }
//
//    print("优异成绩:")
//    let marks = MarkStruct(mark1: 98, mark2: 96, mark3:100)
//    print(marks.mark1)
//    print(marks.mark2)
//    print(marks.mark3)
//
//    print("糟糕成绩:")
//    var fail = MarkStruct(mark1: 34, mark2: 42, mark3: 13)
//    print(fail.mark1)
//    print(fail.mark2)
//    print(fail.mark3)
//}

- (void) testCreate {
    struct MarkStruct {
        NSInteger mark1;
        NSInteger mark2;
        NSInteger mark3;
    };
    
    NSLog(@"优异成绩:");
    struct MarkStruct marks;
    marks.mark1 = 98;
    marks.mark2 = 96;
    marks.mark3 = 100;
    NSLog(@"优异成绩:%ld",marks.mark1);
    NSLog(@"优异成绩:%ld",marks.mark2);
    NSLog(@"优异成绩:%ld",marks.mark3);
    
    
    NSLog(@"糟糕成绩:");
    struct MarkStruct fail;
    fail.mark1 = 34;
    fail.mark2 = 42;
    fail.mark3 = 13;
    NSLog(@"优异成绩:%ld",fail.mark1);
    NSLog(@"优异成绩:%ld",fail.mark2);
    NSLog(@"优异成绩:%ld",fail.mark3);
}
@end
