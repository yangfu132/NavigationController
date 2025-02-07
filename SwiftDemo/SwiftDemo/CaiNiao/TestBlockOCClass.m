//
//  TestBlockOCClass.m
//  SwiftDemo
//
//  Created by FlutterRole on 2024/11/27.
//

#import "TestBlockOCClass.h"
#import "SwiftDemo-Swift.h"

NSInteger gloableVar = 10;


@implementation TestBlockOCClass

- (void) testBlock {
    [self testClosures];
    
    TestBlockClass* swiftBlockDemo = [TestBlockClass new];
    [swiftBlockDemo testBlock];
    
    TestDictionaryClass* swiftDictDemo = [TestDictionaryClass new];
    [swiftDictDemo testDictionary];
}

- (void) testA {
    static NSInteger staticVar = 20;
    // 1.无返回值，无参数
    void (^block1)(void) = ^{
        NSLog(@"block1");
    };
    
    // 2.无返回值，有参数
    void (^block2)(int) = ^(int a) {
        NSLog(@"block2");
    };
    
    int (^block3)(void) = ^ int() {
        NSLog(@"block3");
        return 0;
    };
    
    int (^block4)(void) = ^{
        NSLog(@"block4");
        return 0;
    };
    
    int (^block5)(int) = ^(int a){
        NSLog(@"block5");
        return 0;
    };
    
    int (^block6)(int) = ^(int a){
        NSLog(@"block6");
        return 0;
    };
}

- (void) testClosures {
    void (^studname)(void) = ^{
        NSLog(@"OC 闭包实例");
    };
    studname();
    
    
    
    NSInteger (^divide)(NSInteger val1, NSInteger val2) = ^(NSInteger val1, NSInteger val2) {
        return val1/val2;
    };
    
    NSInteger result = divide(200,20);
    NSLog(@"%@", [@(result) stringValue]);
    
    printf("printf");
}

- (void) testSort {
    NSArray* names = @[@"AT",@"AE",@"D",@"S",@"BE"];
    NSArray* reversed = [names sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [obj1 compare:obj2];
    }];
    
    NSLog(@"%@",reversed);
    
}

//func testTakesAClosure(){
//
//    func someFunctionThatTakesAClosure(closure:() -> Void) {
//        print("func")
//        closure()
//    }
//
//    someFunctionThatTakesAClosure(closure: {
//        print("closure")
//    })
//
//    someFunctionThatTakesAClosure() {
//        print("closure")
//    }
//
//    let names = ["AT", "AE", "D", "S", "BE"]
//    var reversed = names.sorted() {
//        $0 > $1
//    }
//    print("reversed: \(reversed)")
//
//    //注意： 如果函数只需要闭包表达式一个参数，当您使用尾随闭包时，您甚至可以把()省略掉。
//    reversed = names.sorted {
//        $1 > $0
//    }
//    print("reversed: \(reversed)")
//}
//
//func testCapture () {
//    func makeIncrementor(forIncrement amount:Int) -> () -> Int {
//
//        var runningTotal = 0
//        func incrementor() -> Int {
//            runningTotal += amount
//            return runningTotal
//        }
//        return incrementor
//    }
//
//    let incrementByTen = makeIncrementor(forIncrement: 10)
//    print(incrementByTen())
//    print(incrementByTen())
//    print(incrementByTen())
//}
//
//func testReference() {
//    func makeIncrementor(forIncrement amount:Int) -> () -> Int {
//
//        var runningTotal = 0
//        func incrementor() -> Int {
//            runningTotal += amount
//            return runningTotal
//        }
//        return incrementor
//    }
//
//    let incrementByTen = makeIncrementor(forIncrement: 10)
//    incrementByTen()
//
//    incrementByTen()
//
//    incrementByTen()
//
//    let alsoIncrementByTen = incrementByTen
//    print(alsoIncrementByTen)
//}

@end
